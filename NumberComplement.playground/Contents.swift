//: Playground - noun: a place where people can play

import UIKit
/*
Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.

Note:
The given integer is guaranteed to fit within the range of a 32-bit signed integer.
You could assume no leading zero bit in the integer’s binary representation.
Example 1:
Input: 5
Output: 2
Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
Example 2:
Input: 1
Output: 0
Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
*/

func findComplement(_ num: Int) -> Int {
    var quotient = num
    var numArr = [Int]()
    
    while(quotient / 2 != 0) {
        numArr.append(quotient % 2)
        quotient = quotient / 2
    }
    numArr.append(quotient % 2)
    print(numArr)
    
    let complimentNumArr = numArr.map({ return 1 - $0})
    var digit = 1
    var complement = 0
    
    for i in 0...complimentNumArr.count - 1 {
        complement += complimentNumArr[i] * digit
        digit = digit * 2
    }
    
    print(complimentNumArr)
    
    return complement
}

print(findComplement(501))




