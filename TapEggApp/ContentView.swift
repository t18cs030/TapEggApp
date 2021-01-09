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
                            Text("たまごのアプリ")
                                .padding()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .border(Color.black)
                        }
                        Spacer()
                        Button(action:{self.isStart.toggle()}){
                            Text("スタート")
                                .font(.title)
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
            ContentView()
            ContentView()
        }
    }
}


