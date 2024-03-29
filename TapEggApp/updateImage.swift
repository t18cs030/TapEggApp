//
//  updateImage.swift
//  TapEggApp
//
//  Created by kenta tanii on 2021/01/22.
//
//
import SwiftUI
import Foundation

class updateList: ObservableObject{
    @Published var changeList: [Int]{
        didSet{
            UserDefaults.standard.set(changeList,forKey: "chengeList")
        }
    }
    @Published var finishList:[Int]{
        didSet{
            UserDefaults.standard.set(finishList,forKey: "finishList")
        }
    }
    init(){
        let originList = [10,50,50,60,60,70,70,80]
        changeList = [100000]
        finishList = [0]

        var sum = 100000;
        var index = 0;
        while (sum-originList[index%8]*(index/8+1) >= 0){
            let i = index % 8
            let max = index / 8 + 1
            changeList.append(sum - originList[i]*max)
            sum -= originList[i]*max
            index += 1
        }
        changeList.append(0)
        
        for i in stride(from: 6, to: changeList.count, by: 8){
            finishList.append(changeList[i])
        }
    }
    func isFinish(number:Int)->Bool{
        return finishList.contains(number);
    }
    func getIndex(number:Int)->Int{
        if(number < 0){return -1;}
        else if (number == 0){return 7;}
        var i:Int = 0;
        while(changeList[i]>number){i+=1}
        return i%8;
    }
    func show() -> Void {
        print(changeList)
    }
}
