//: Playground - noun: a place where people can play

import UIKit


//A self-dividing number is a number that is divisible by every digit it contains.
//
//For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
//
//Also, a self-dividing number is not allowed to contain the digit zero.
//
//Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.
//
//Example 1:
//Input:
//left = 1, right = 22
//Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
//The boundaries of each input argument are 1 <= left <= right <= 10000

func selfDividingNumberCount(left: Int, right: Int) -> [Int] {
    
    var selfDividingNumbers = [Int]()
    
    for number in left...right {
        if String(number).contains("0") { continue }
        
        let isDivingNumber = checkDigits(number: number)
        if isDivingNumber {
            selfDividingNumbers.append(number)
        }
    }
    
    return selfDividingNumbers
}

func checkDigits(number: Int) -> Bool{
    
    var isDivingNumber = true
    var divideDigit = 10
    
    while (number / divideDigit > 0) {
        
        let digit = (number % divideDigit) / (divideDigit / 10)
        if number % digit != 0 {
            isDivingNumber = false
        }
        divideDigit = divideDigit * 10
    }
    
    let digit = number / (divideDigit / 10)
    if number % digit != 0 {
        isDivingNumber = false
    }

    return isDivingNumber
}

print(selfDividingNumberCount(left: 1, right: 23))
//checkDigits(number: 12345)


















