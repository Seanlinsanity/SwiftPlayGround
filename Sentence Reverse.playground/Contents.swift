//: Playground - noun: a place where people can play

import UIKit
/*
 You are given an array of characters arr that consists of sequences of characters separated by space characters. Each space-delimited sequence of characters defines a word.

Implement a function reverseWords that reverses the order of the words in the array in the most efficient manner.

Explain your solution and analyze its time and space complexities.

Example:

input:  arr = [ 'p', 'e', 'r', 'f', 'e', 'c', 't', '  ',
'm', 'a', 'k', 'e', 's', '  ',
'p', 'r', 'a', 'c', 't', 'i', 'c', 'e' ]

output: [ 'p', 'r', 'a', 'c', 't', 'i', 'c', 'e', '  ',
'm', 'a', 'k', 'e', 's', '  ',
'p', 'e', 'r', 'f', 'e', 'c', 't' ]
 */

func reverseWords(arr: [Character]) -> [Character]{
    
    var reverseWords = arr
    var temp: Character? = nil
    let length = arr.count
    var wordStart: Int?
    
    swapArr(arr: &reverseWords, temp: &temp, start: 0, end: length - 1)
    
    for i in 0...length - 1{
        if reverseWords[i] != " " && wordStart == nil {
            wordStart = i
        }else if reverseWords[i] == " " && wordStart != nil{
            swapArr(arr: &reverseWords, temp: &temp, start: wordStart!, end: i - 1)
            wordStart = nil
        }
    }
    
    if wordStart != nil {
        swapArr(arr: &reverseWords, temp: &temp, start: wordStart!, end: length - 1)
    }
    
    return reverseWords
    
}

func swapArr(arr: inout [Character], temp: inout Character?, start: Int, end: Int) {
    for i in start...start + (end - start) / 2 {
        //swap
        temp = arr[i]
        arr[i] = arr[end + start - i]
        arr[end + start - i] = temp!
    }
}

print(reverseWords(arr: ["a"," "," ", " ","b"]))
print(reverseWords(arr: ["p","e","r","f","e","c","t"," ","m","a","k","e","s"," ","p","r","a","c","t","i","c","e"]))
