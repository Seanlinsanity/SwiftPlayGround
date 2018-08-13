//: Playground - noun: a place where people can play

import UIKit

func mergeSort(numbersArray: [Int]) -> [Int] {
    
    if numbersArray.count <= 1 { return numbersArray }
    
    //split array
    let leftArray = Array(numbersArray[0..<numbersArray.count/2])
    let rightArray = Array(numbersArray[numbersArray.count/2..<numbersArray.count])
    
    print(leftArray, rightArray)
    
    //critical point
    return merge(leftArray: mergeSort(numbersArray: leftArray), rightArray: mergeSort(numbersArray: rightArray))
}

func merge(leftArray: [Int], rightArray: [Int]) -> [Int]{
    
    var mergeArray = [Int]()
    var left = leftArray
    var right = rightArray

    print("merge: ", left, right)
    
    while left.count > 0 && right.count > 0 {
        if left[0] < right[0]{
            mergeArray.append(left[0])
            left.remove(at: 0)
        }else if left[0] > right[0]{
            mergeArray.append(right[0])
            right.remove(at: 0)
        }
    }
    
    return mergeArray + left + right
}


mergeSort(numbersArray: [30, 2, 3, 4, 1, 5, 9, 11])

//merge(leftArray: [2, 3, 7, 19], rightArray: [6, 24])







