//
//  ContentView.swift
//  TapEggApp
//
//  Created by kenta tanii on 2020/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var isStart = false
    var body: some View {
        VStack{
            if isStart{
                CountView()
                    .edgesIgnoringSafeArea(.all)
            }else{
                ZStack{
                    Image("BamBoo")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        HStack{
                            Spacer()
                            Text("Tap Egg App")
                                .padding()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .border(Color.black)
                        }
                        Spacer()
                        Button(action:{self.isStart.toggle()}){
                            Text("start")
                                .font(.largeTitle)
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                        }.padding()
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewDevice("iPhone 8")
            ContentView().previewDevice("iPhone 11")
            ContentView().previewDevice("iPhone 12")
        }
    }
}


