//: Playground - noun: a place where people can play

import UIKit

//Given a binary matrix A, we want to flip the image horizontally, then invert it, and return the resulting image.
//
//To flip an image horizontally means that each row of the image is reversed.  For example, flipping [1, 1, 0] horizontally results in [0, 1, 1].
//
//To invert an image means that each 0 is replaced by 1, and each 1 is replaced by 0. For example, inverting [0, 1, 1] results in [1, 0, 0].
//
//Example 1:
//
//Input: [[1,1,0],[1,0,1],[0,0,0]]
//Output: [[1,0,0],[0,1,0],[1,1,1]]
//Explanation: First reverse each row: [[0,1,1],[1,0,1],[0,0,0]].
//Then, invert the image: [[1,0,0],[0,1,0],[1,1,1]]
//Example 2:
//
//Input: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
//Output: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
//Explanation: First reverse each row: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]].
//Then invert the image: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]


//var imageMatrix = [[1,1,0],[1,0,1],[0,0,0]]
var imageMatrix = [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]


func flippingImage(imageMatrix: inout [[Int]]) -> [[Int]]{
    
    for row in 0...imageMatrix.count - 1 {
        let numbersInRow = imageMatrix[row].count
        var currentIndex = 0
        var swapIndex = (numbersInRow - 1) - currentIndex
        
        while(currentIndex <= swapIndex){
            print("currentIndex:", currentIndex, "swapIndex:", swapIndex)
            
            let swapNumber = imageMatrix[row][currentIndex]
            imageMatrix[row][currentIndex] = 1 - imageMatrix[row][swapIndex]
            imageMatrix[row][swapIndex] = 1 - swapNumber
    
            currentIndex += 1
            swapIndex = numbersInRow - 1 - currentIndex
        }
    }
    
    return imageMatrix    
}

print(flippingImage(imageMatrix: &imageMatrix))








