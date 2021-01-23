//
//  CountView.swift
//  TapEggApp
//
//  Created by kenta tanii on 2020/12/20.
//
/* タップで画像を更新するには？
 *  ZStackでボタンを画像を重ねる->.onTapで画像を更新
 *　カスタムボタンスタイルで更新
        ->この方法では、もしかしたらlabelの部分は更新できないかも
*/

import SwiftUI

struct CountView: View {
    @ObservedObject var num = saveNumber()
    @ObservedObject var updateImageList = updateList()
    @State private var resetingAlert = false
    @State var finishFlag = false

    func updateImage(number:Int) -> Image{
        let index = updateImageList.getIndex(number: number)
        switch(index){
        case 0:
            do {return Image("Broken-Egg-0")}
        case 1:
            do {return Image("Broken-Egg-1")}
        case 2:
            do {return Image("Broken-Egg-2")}
        case 3:
            do {return Image("Broken-Egg-3")}
        case 4:
            do {return Image("Broken-Egg-4")}
        case 5:
            do {return Image("Broken-Egg-5")}
        case 6:
            do {return Image("Broken-Egg-6")}
        case 7:
            do {return Image("Broken-Egg-fin")}
        default:
            do {return Image("Broken-Egg-0")}
        }
    }
    var body: some View {
        ZStack{
            Image("BamBoo")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack{
                        Spacer()
                        Button(
                            action: {
                                self.resetingAlert = true
                            },
                            label: {
                            Text("Reset")
                                .padding()
                                .border(Color.black)
                                .foregroundColor(Color.white)
                            })
                            .alert(isPresented: $resetingAlert)
                            {
                                Alert(title: Text("title"),
                                      message: Text("reset しますか？"),
                                      primaryButton:
                                        .default(Text("ok"),action:{num.reset()}),secondaryButton: .default(Text("cansel")))
                            }
                    }.padding()
                    Text("\(num.num)")
                        .multilineTextAlignment(.center)
                        .font(.custom("Avenir-medium", fixedSize: 75))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.8))
                    Button(action:
                            {
                                //表示している数値を１減らす
                                if(num.num > 0){num.num -= 100}
                                //負の値の処理
                                else{num.num = 0}
                                // hiyokoの生まれた数をカウント
                                if(updateImageList.isFinish(number: num.num)){
                                    num.addHiyokoCount()}
                            }
                        )
                        {
                            updateImage(number:num.num)
                                .resizable()
                                .scaledToFit()
                                .padding()
                    }.frame(width: 400,
                            height: 200,
                            alignment: .center)
                    if(num.hiyokoCount>0){
                        HStack{
                            Spacer()
                            Image("hiyoko")
                                .resizable()
                                .scaledToFit()
                            Text("* \(num.hiyokoCount)")
                                .padding()
                        }.frame(height: 100)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CountView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CountView()
        }
    }
}
