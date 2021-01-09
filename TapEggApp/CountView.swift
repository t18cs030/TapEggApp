//
//  CountView.swift
//  TapEggApp
//
//  Created by kenta tanii on 2020/12/20.
//

import SwiftUI

struct CountView: View {
    @ObservedObject var num = saveNumber()
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
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.9))
                    Button(action:
                            {num.num -= 1;},
                           label:
                            {Image("Broken-Egg-0")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200,
                                       height: 300,
                                       alignment: .center)}
                        ).frame(maxWidth: .infinity,
                               maxHeight: 400,
                               alignment: .center)
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
