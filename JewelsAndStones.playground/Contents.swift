//: Playground - noun: a place where people can play

import UIKit

//You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
//
//The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
//
//Example:
//
//Input: J = "aA", S = "aAAbbbb"
//Output: 3
//
//Example:
//
//Input: J = "z", S = "ZZ"
//Output: 0
//Note:
//
//S and J will consist of letters and have length at most 50.
//The characters in J are distinct.

let J = "aA"
let S = "ZaaAAbbbbZ"

func numbersOfJewelsInStones(jewels: String, stones: String) -> Int{
    
    var numbersOfJewels = 0

    for stone in stones {
        if jewels.contains(stone){
            numbersOfJewels += 1
        }
    }
    
    return numbersOfJewels
    
}

numbersOfJewelsInStones(jewels: J, stones: S)







