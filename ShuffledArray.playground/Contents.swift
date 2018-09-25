import UIKit

func shuffledArray<T>(arr: [T]) -> [T] {
    var originArr = arr
    
    for i in (0...arr.count - 1).reversed(){
        let index = Int.random(in: 0...i)
        let temp = originArr[i]
        originArr[i] = originArr[index]
        originArr[index] = temp
    }
//    var shuffledArr = [T]()
//    while(originArr.count > 0) {
//        let index = Int.random(in: 0...originArr.count - 1)
//        shuffledArr.append(originArr.remove(at: index))
//    }
    return originArr
}

shuffledArray(arr: [1,2,3,4,5,6,7,8,9])
shuffledArray(arr: [8.6, 3.4, 2.7, 7.9, 2.1, 5.2])
shuffledArray(arr: ["james", "irving", "curry", "klay", "harden", "allen", "bryant"])



