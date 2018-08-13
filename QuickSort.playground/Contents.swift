//: Playground - noun: a place where people can play

import UIKit

func quickSorting(arr: [Int]) -> [Int]{
    
    var sortingArr = arr
    if sortingArr.count < 2 {
        return sortingArr
    }
    
    let keyIndex = sortingArr.count - 1
    var leftIndex = 0
    var rightIndex = sortingArr.count - 2
    
    while(leftIndex <= rightIndex) {
        print(leftIndex, rightIndex)
        if sortingArr[leftIndex] > sortingArr[keyIndex] && sortingArr[rightIndex] < sortingArr[keyIndex]{
            let temp = sortingArr[leftIndex]
            sortingArr[leftIndex] = sortingArr[rightIndex]
            sortingArr[rightIndex] = temp
            
        }else if sortingArr[leftIndex] < sortingArr[keyIndex]{
            leftIndex += 1
        }else if sortingArr[rightIndex] > sortingArr[keyIndex]{
            rightIndex -= 1
        }
    }
    
    let keyValue = sortingArr[keyIndex]
    sortingArr[keyIndex] = sortingArr[leftIndex]
    sortingArr[leftIndex] = keyValue
    print(keyValue, "keyIndex: \(keyIndex), rightIndex: \(rightIndex)")
    
    
    let leftArr = Array(sortingArr[0..<leftIndex])
    print(leftArr)
    let rightArr = Array(sortingArr[leftIndex + 1..<sortingArr.count])
    print(rightArr)
    return quickSorting(arr: leftArr) + [Int(keyValue)] + quickSorting(arr: rightArr)
}

var arr = [3, 11, 22, 4, 7, 91, 29, 30, 24, -13, -9]
let quickArr = [2, 0, 5, -3, 10]
print(quickSorting(arr: arr) == arr.sorted(by: {$0 < $1}))
