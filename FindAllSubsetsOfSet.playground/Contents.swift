//: Playground - noun: a place where people can play

import UIKit

let theSet : Set = [1, 2, 3]

func findAllSubsets(checkSet: Set<Int>) {
    
    var setArray = [Int]()
    for i in theSet {
        setArray.append(i)
    }
    
    let aSet : Set<Int> = []
    findSubsets(setArray: setArray, aSet: aSet, index: 0)
    
}

func findSubsets(setArray: [Int], aSet: Set<Int>, index: Int) {
    
    if index == setArray.count {
        print(aSet)
        return
    }
    
    var set1: Set = aSet
    set1.insert(setArray[index])
    
    let set2: Set = aSet
    
    let nextIndex = index + 1
    
    findSubsets(setArray: setArray, aSet: set1, index: nextIndex)
    findSubsets(setArray: setArray, aSet: set2, index: nextIndex)
    
    
}

findAllSubsets(checkSet: theSet)
