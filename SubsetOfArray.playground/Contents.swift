//: Playground - noun: a place where people can play

import UIKit

func isSubset(_ arr1: [Character], _ arr2: [Character]) -> Bool {
    var letterSet = Set<Character>()
    
    for letter in arr1 {
        letterSet.insert(letter)
    }
    
    for letter in arr2 {
        if !letterSet.contains(letter) { return false }
    }
    
    return true
}

print(isSubset(["A","B","C","D","E"], ["A","E","D"]))
print(isSubset(["A","B","C","D","E"], ["A","D","Z"]))
print(isSubset(["A","B","C","D","E"], ["A","A","D","E"]))
