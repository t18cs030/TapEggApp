//import SwiftUI
//
//class updateList{
//    private var list:[Int] = [100000]
//    private var originList:[Int] = []
//
//    init(){
//        originList = [10,50,50,60,60,70,70,80]
//
//        var sum = 100000;
//        var index = 0;
//        while (sum-originList[index%8]*(index/8+1) >= 0){
//            let i = index % 8
//            let max = index / 8 + 1
//            list.append(sum - originList[i]*max)
//            sum -= originList[i]*max
//            index += 1
//        }
//        list.append(0)
//        return;
//    }
//    func getIndex(number:Int)->Int{
//        if(number < 0){return -1;}
//        else if(number == 0){return 7;}
//        var i:Int = 0;
//        while(list[i]>number){i+=1}
//        return i%8;
//    }
//    func show(){
//        print(originList)
//        print(list)
//        print(list.count % 8)
//        print(list.count / 8)
//    }
//}
//
//var l = updateList()
//l.show()
//print(l.getIndex(number: 100000))
//print(l.getIndex(number: 99999))
//print(l.getIndex(number: 99980))
//print(l.getIndex(number: 12345))
//print("loading...")
//print("hello")
