//
//  saveNumber.swift
//  TapEggApp
//
//  Created by kenta tanii on 2021/01/09.
//

import Foundation
import SwiftUI

class saveNumber: ObservableObject{
    @Published var num: Int{
        didSet{
            UserDefaults.standard.set(num,forKey: "num")
        }
    }
    @Published var hiyokoCount: Int{
        didSet{
            UserDefaults.standard.set(hiyokoCount,forKey: "hiyokoCount")
        }
    }
    init() {
        UserDefaults.standard.register(defaults: ["num":100000,"hiyokoCount":0])
        num = UserDefaults.standard.integer(forKey: "num")
        hiyokoCount = UserDefaults.standard.integer(forKey: "finishCount")
    }
    public func reset(){
        num = 100000
        hiyokoCount = 0
    }
    public func isFinish() -> Bool{
        if(num == 0){return true}
        else{return false}
    }
    public func addHiyokoCount(){
        hiyokoCount += 1;
    }
}
