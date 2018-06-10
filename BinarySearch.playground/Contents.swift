//: Playground - noun: a place where people can play

import UIKit

var numbers = [Int]()

for i in 1...1001{
    numbers.append(i)
}

func binarySearchForValue(searchValue: Int, array: [Int]) -> Bool {
        
        var leftIndex = 0
        var rightIndex = array.count
    
    repeat {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        print("\(leftIndex),\(rightIndex),\(middleValue)")
        
        if searchValue == middleValue{
            return true
        }
        
        if searchValue < middleValue{
            
            rightIndex = middleIndex - 1
            
        }
        
        if  searchValue > middleValue{
        
            leftIndex = middleIndex + 1
        }
        
    }while (leftIndex < rightIndex)
    
    return false
}

binarySearchForValue(searchValue: 1562, array: numbers)
