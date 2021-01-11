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
    @Published var finishCount: Int{
        didSet{
            UserDefaults.standard.set(finishCount,forKey: "finishCount")
        }
    }
    init() {
        UserDefaults.standard.register(defaults: ["num":100000,"finishCount":0])
        num = UserDefaults.standard.integer(forKey: "num")
        finishCount = UserDefaults.standard.integer(forKey: "finishCount")
    }
    public func reset(){
        num = 100000
        finishCount = 0
    }
    public func isFinish() -> Bool{
        if(num == 0){return true}
        else{return false}
    }
    public func addFinishCount(){
        finishCount += 1;
    }
}
