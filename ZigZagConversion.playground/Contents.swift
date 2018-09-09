//: Playground - noun: a place where people can play

import UIKit
/*
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string s, int numRows);
Example 1:

Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
Example 2:

Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:

P     I    N
A   L S  I G
Y A   H R
P     I
 */

func convert(_ s: String, _ numRows: Int) -> String {
    
    if numRows <= 1 { return s }
    
    let characters = Array(s)
    let cycle = numRows * 2 - 2
    let numCycles = (characters.count / cycle)
    let numCycleRemainders = characters.count % cycle > numRows ? characters.count - numRows + 1 : 1
    let numColumns = numCycles * (numRows - 1)  + numCycleRemainders
    
    var arr = Array(repeating: Array(repeating: "", count: numColumns), count: numRows)
    
    for (index, value) in characters.enumerated() {
        let column = (index / cycle) * (numRows - 1) + (index % cycle >= numRows ? (index % cycle) - (numRows - 1) : 0)
        let row = index % cycle >= numRows ? (numRows - 1) - ((index % cycle) - (numRows - 1)) : index % cycle
        
        arr[row][column] = String(value)
    }
    print(arr)
    
    var convertString = ""
    for i in 0...arr.count - 1 {
        for j in 0...arr[i].count - 1 {
            convertString += arr[i][j]
        }
    }
    
    return convertString
}


print(convert("PAYPALISHIRING", 3))





