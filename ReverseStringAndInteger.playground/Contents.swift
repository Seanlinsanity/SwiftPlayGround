//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func reversedString(str: String) -> String {
    
    let characters = Array(str.characters).reversed()
    let result = String(characters)
    
    //var result = ""
    
    /*for character in characters {
     
     result = String(character) + result
     }*/
    
    return result
    
    
}

print(reversedString(str: str))

func reverseInt(value: Int) -> Int {
    
    let checkPositive = (value > 0) ? 1 : (-1)
    let valueString = String(value * checkPositive).characters.reversed()
    
    return (Int(String(valueString)) ?? 0) * checkPositive
}

print(reverseInt(value: -379000))
