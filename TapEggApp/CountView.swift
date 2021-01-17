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
    func updateImage(number:Int) -> Image{
        if(number == 100000)
        {return Image("Broken-Egg-0")}
        else if(99990<=number && number<100000)
        {return Image("Broken-Egg-1")}
        else if(99980<=number && number<99990)
        {return Image("Broken-Egg-2")}
        else if(99970<=number && number<99980)
        {return Image("Broken-Egg-3")}
        else if(99960<=number && number<99970)
        {return Image("Broken-Egg-4")}
        else if(99950<=number && number<99960)
        {return Image("Broken-Egg-5")}
        else if(99940<=number && number<99950)
        {return Image("Broken-Egg-6")}
        else if(99930<=number && number<99940)
        {return Image("Broken-Egg-fin")}
        else
        {return Image("Broken-Egg-0")}
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
                            action: {num.reset()},
                            label: {
                            Text("Reset")
                                .padding()
                                .border(Color.black)
                                .foregroundColor(Color.white)
                            })
                    }.padding()
                    Text("\(num.num)")
                        .multilineTextAlignment(.center)
                        .padding()
                        //.font(.system(size:80,design:.rounded))
                        .font(.custom("Thonburi", fixedSize: 60))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.9))
                    Button(action:
                            {
                                num.num -= 1;
                                if(num.num <= 99970)
                                    {num.addFinishCount()}
                            },
                           label:
                            {
                                updateImage(number:num.num)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200,
                                       height: 350,
                                       alignment: .center)
                                .padding()
                            }
                    )
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
                    Button(action: {}){
                        Text("Button")
                    }.buttonStyle(CustomButtonStyle())
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
