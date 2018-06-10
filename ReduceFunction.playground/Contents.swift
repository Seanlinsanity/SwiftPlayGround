//: Playground - noun: a place where people can play

import UIKit

func summation(numbers: [Int]) -> Int {
    var sum = 0
    numbers.forEach { sum += $0 }
    
    return sum
}

summation(numbers: [1, 2, 3, 4])

let mySum = [1, 2, 3, 4].reduce(0) { (res, next) -> Int in
    return res + next
}

let mySum2 = [1, 2, 3, 4].reduce(0, {$0 + $1})

print(mySum)
print(mySum2)

let myProduct = [1, 2, 3, 4].reduce(1) { (res, next) -> Int in
    return res * next
}

let myProduct2 = [1, 2, 3, 4].reduce(1, {$0 * $1})
print(myProduct)
print(myProduct2)

let facts = ["Brian", "is", "the", "greatest", "in", "all", "time"]
let trueFacts = facts.reduce("") { (res, next) -> String in
    return res + next + " "
}
let trueFacts2 = facts.reduce("", {$0 + $1 + " "})

print(trueFacts)
print(trueFacts2)

