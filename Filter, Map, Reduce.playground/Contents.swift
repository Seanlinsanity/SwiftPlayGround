//: Playground - noun: a place where people can play

import UIKit

let numbers = [2, 4, 9, 31, 39, 24, 11, 30]

let evenNumbers = numbers.filter({return $0 % 2 == 0})
print(evenNumbers)

let doubleNumbers = numbers.map({return $0 * 2})
print(doubleNumbers)

let sumOfNumbers = numbers.reduce(0, {sum, number in sum + number})
//  sumOfNumbers = numbers.reduce("initial value" of the reduce, {"variable" of the reduce, "element" of sumOfNumbers [in] the algorithm of initial value and element})
print(sumOfNumbers)

