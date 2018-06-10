//: Playground - noun: a place where people can play

import UIKit

func filterWithPredicateClosure(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filterNumbers = [Int]()
    for num in numbers {
        if closure(num) {
            filterNumbers.append(num)
        }
    }
    
    return filterNumbers
}

func greaterThanThree(value: Int) -> Bool {
    return value > 3
}

func divisibleByFive(value: Int) -> Bool {
    return value % 5 == 0
}

let firstFilteredList = filterWithPredicateClosure(closure: greaterThanThree, numbers: [1, 2, 3, 4, 5, 10])
let secFilteredList = filterWithPredicateClosure(closure: divisibleByFive, numbers: [1, 2, 3, 4, 5, 10])

//let filteredList = filterWithPredicateClosure(closure: { (num) -> Bool in
//    return num > 3
//}, numbers: [1, 2, 3, 4, 5, 10])

print(firstFilteredList)
print(secFilteredList)
