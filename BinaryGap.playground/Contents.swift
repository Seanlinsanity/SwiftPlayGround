//: Playground - noun: a place where people can play

import UIKit
/*
A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.

Write a function:

public func solution(_ N : Int) -> Int

that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..2,147,483,647].
*/

public func solution(_ N : Int) -> Int {
    
    let digit = 2
    var quotient = N
    var binaryString = ""
    
    while (quotient / digit != 0) {
        binaryString = "\(quotient % digit)" + binaryString
        quotient = quotient / digit
    }
    
    binaryString = "\(quotient % digit)" + binaryString
    print(binaryString)
    return getLongestBinaryGap(binaryString)
}

func getLongestBinaryGap(_ binaryString: String) -> Int {
    
    var maxLength = 0
    var lenght = 0
    var prev: Character? = nil
    
    for character in Array(binaryString) {
        if prev == "1" && character == "0" {
            lenght = 1
        }else if character == "0" && lenght > 0 {
            lenght += 1
        }else if prev == "0" && character == "1" {
            maxLength = max(maxLength, lenght)
        }
        prev = character
    }
    
    return maxLength
}

print(solution(529))
