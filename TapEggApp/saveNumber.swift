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
    init() {
        UserDefaults.standard.register(defaults: ["num":100000])
        num = UserDefaults.standard.integer(forKey: "num")
    }
    public func reset(){
        num = 100000
    }
}
