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
    @State var apple = [0,0]

    func setApple(){
        for count in 0...10 {
            apple.append(count)
        }
    }
    func updateImage(number:Int) -> Image{
        if(number == 100000)
        {return Image("Broken-Egg-0")}
        else if(99990<=number && number<100000)
        {return Image("Broken-Egg-1")}
        else if(99950<=number && number<99990)
        {return Image("Broken-Egg-2")}
        else if(99900<=number && number<99950)
        {return Image("Broken-Egg-3")}
        else if(99840<=number && number<99900)
        {return Image("Broken-Egg-4")}
        else if(99780<=number && number<99840)
        {return Image("Broken-Egg-5")}
        else if(99710<=number && number<99780)
        {return Image("Broken-Egg-6")}
        else if(99640<=number && number<99710)
        {return Image("Broken-Egg-fin")}
        else
        {return Image("Broken-Egg-0")}
    }
    func checkHiyoko(number:Int)->Bool{
        if(number == 99850){return true;}
        return false;
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
                                      primaryButton: .default(Text("ok"),
                                                              action: {num.reset()}),
                                      secondaryButton: .default(Text("cansel")))
                            }
                    }.padding()
                    Text("\(num.num)")
                        .multilineTextAlignment(.center)
                        .padding()
                        //.font(.system(size:80,design:.rounded))
                        .font(.custom("Avenir-medium", fixedSize: 75))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.8))
                    Button(action:
                            {
                                num.num -= 1;
                                if(checkHiyoko(number: num.num))
                                    {num.addFinishCount()}
                            }
                        )
                        {
                                updateImage(number:num.num)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200,
                                       height: 350,
                                       alignment: .center)
                                .padding()
                    }
                    if(num.finishCount>0){
                        HStack{
                            Spacer()
                            Image("hiyoko")
                                .resizable()
                                .scaledToFit()
                            Text("* \(num.finishCount)")
                                .padding()
                        }.frame(width:.infinity,
                                height: 100,
                                alignment:.trailing)
                    }
                    Button(action: {self.setApple()}){
                        Text("Button")
                    }.buttonStyle(CustomButtonStyle())
                    List(apple, id:\.self){apples in
                        Text("\(apples)")
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CountView_Previews: PreviewProvider {
    static var previews: some View {
        CountView()
    }
}
