import SwiftUI

class updateList{
    private var list:[Int] = []
    private var originList:[Int] = []
    
    init(){
        originList = [10,50,50,60,60,70,70]

        var sum = 100000;
        var index = 0;
        while (sum-originList[index%7]*(index/7+1) >= 0){
            let i = index % 7
            let max = index / 7 + 1
            list.append(sum - originList[i]*max)
            sum -= originList[i]*max
            index += 1
        }
        return;
    }
    func show(){
        print(originList)
        print(list)
        print(list.count % 7)
        print(list.count / 7)
    }
}

var l = updateList()
l.show()
