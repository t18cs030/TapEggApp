//
//  updateImage.swift
//  TapEggApp
//
//  Created by kenta tanii on 2021/01/22.
//

import SwiftUI

class updateList: ObservableObject{
    @Published var changeList: [Int]{
        didSet{
            UserDefaults.standard.set(changeList,forKey: "chengeList")
        }
    }
    init(){
        let originList = [10,50,50,60,60,70,70]
        changeList = [100000]

        var sum = 100000;
        var index = 0;
        while (sum-originList[index%7]*(index/7+1) >= 0){
            let i = index % 7
            let max = index / 7 + 1
            changeList.append(sum - originList[i]*max)
            sum -= originList[i]*max
            index += 1
        }
    }
    func show() -> Void {
        print(changeList)
    }
}
