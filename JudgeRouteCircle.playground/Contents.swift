//: Playground - noun: a place where people can play

import UIKit

//Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.
//
//The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle.
//
//Example 1:
//Input: "UD"
//Output: true
//Example 2:
//Input: "LL"
//Output: false

let route = "UUUURLDLDDRD"

func isCircleRoute(route: String) -> Bool {
    
    var moveDictionary = [Character : Int]()
    
    let movements = Array(route)
    for move in movements {
        
        if let numberOfSteps = moveDictionary[move]{
            moveDictionary[move] = numberOfSteps + 1
        }else{
            moveDictionary[move] = 1
        }
    }
    
    let rightSteps = moveDictionary["R"]
    let leftSteps = moveDictionary["L"]
    let upSteps = moveDictionary["U"]
    let downSteps = moveDictionary["D"]
    
    if rightSteps == leftSteps && upSteps == downSteps {
        return true
    }else{
        return false
    }

}

print(isCircleRoute(route: route))
