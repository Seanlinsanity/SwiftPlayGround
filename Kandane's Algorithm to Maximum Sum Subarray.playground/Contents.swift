//: Playground - noun: a place where people can play

import UIKit

let array = [1, -3, 2, 1, 1, -1]

var max_current = 0
var max_global = 0

func findMaxSumSubarray(array: [Int]) -> Int{
    
    max_current = array[0]
    max_global = array[0]
    
    for i in 1...array.count - 1 {
        max_current = max(array[i], max_current + array[i])
        
        if max_current > max_global {
            max_global = max_current
        }
        
    }
    return max_global
}

print(findMaxSumSubarray(array: array))
