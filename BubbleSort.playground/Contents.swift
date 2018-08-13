//: Playground - noun: a place where people can play

import UIKit
import XCTest

var arr = [3, 11, 22, 4, 7, 91, 29, 30, 24, -13, -9, 34]

func bubbleSorting(arr: [Int]) -> [Int] {
    var sortingArr = arr
    for i in 0...sortingArr.count - 1 {
        print(i)
        for j in 0..<(sortingArr.count - 1) - i {
            if sortingArr[j] > sortingArr[j + 1] {
                let temp = sortingArr[j + 1]
                sortingArr[j + 1] = sortingArr[j]
                sortingArr[j] = temp
            }
        }
    }
    
    return sortingArr
    
}
let bubbleSortingArr = bubbleSorting(arr: arr)
print(bubbleSortingArr == arr.sorted(by:{ $0 < $1 }) ? true : false)
XCTAssertEqual(bubbleSortingArr, arr.sorted(by: { $0 < $1 }))
