//: Playground - noun: a place where people can play

import UIKit
/*
You are given an array and you need to find number of tripets of indices (i, j, k) such that the elements at those indices are in geometric progression for a given common ratio r and i < j < k.

For example, arr = [1, 4, 16, 64]. If r = 4, we have [1, 4, 16] and [4, 16, 64] at indices (0, 1, 2) and (1, 2, 3), return 2.

Function Description

Complete the countTriplets function in the editor below. It should return the number of triplets forming a geometric progression for a given ratio as an integer.
 
 */

func countTriplets(arr: [Int], r: Int) -> Int {
    var tripletCount = 0
    var midElementDict = [Int: Int]()
    var lastElementDict = [Int: Int]()
    
    for num in arr {
        if lastElementDict[num] != nil {
            tripletCount += lastElementDict[num]!
        }
        if midElementDict[num] != nil {
            lastElementDict[num * r] = (lastElementDict[num * r] ?? 0) + midElementDict[num]!
        }
        print(midElementDict, lastElementDict)
        midElementDict[num * r] =  (midElementDict[num * r] ?? 0) + 1
        print(midElementDict, lastElementDict)
    }
    
    return tripletCount
}

print(countTriplets(arr: [1, 3, 9, 9, 27, 81], r: 3))








