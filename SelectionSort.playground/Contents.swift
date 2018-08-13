//: Playground - noun: a place where people can play

import UIKit

let arr = [3, 11, 22, 4, 7, 91, 29, 30, 24, -13, -9]
print(arr.count)

func selectionSorting(arr: [Int]) -> [Int] {
    var sortingArr = arr
    for i in 0...(sortingArr.count - 2) {
        
        var minIndex = i
        for j in (i + 1)...(sortingArr.count - 1) {
            
            if sortingArr[j] < sortingArr[minIndex] {
                minIndex = j
            }
        }
        
        if minIndex != i {
            let temp = sortingArr[minIndex]
            sortingArr[minIndex] = sortingArr[i]
            sortingArr[i] = temp
            
        }
        
    }
    return sortingArr
    
}


let sortingArr = selectionSorting(arr: arr)
print(sortingArr == arr.sorted(by:{ $0 < $1 }) ? true : false)
