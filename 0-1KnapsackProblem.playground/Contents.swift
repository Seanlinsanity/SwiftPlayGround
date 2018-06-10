//: Playground - noun: a place where people can play

import UIKit

var variablePairsDoubleArray = Array(repeating: Array(repeating: -1, count: 6), count: 11)

let weightArray = [ 0, 1, 2, 4, 2, 5]
let valueArray = [0, 5, 3, 5, 3, 2]
var result = 0

func FindMaxValueWithConstantWeight(chooseIndex: Int, constantWeight: Int) -> Int{
    
    if variablePairsDoubleArray[constantWeight][chooseIndex] > 0 {
        return variablePairsDoubleArray[constantWeight][chooseIndex]
    }
    
    if chooseIndex == 0 || constantWeight == 0{
        result = 0
        
    }else if weightArray[chooseIndex] > constantWeight{
        result = FindMaxValueWithConstantWeight(chooseIndex: chooseIndex - 1, constantWeight: constantWeight)
        
    }else{
        
        let noChoice = FindMaxValueWithConstantWeight(chooseIndex: chooseIndex - 1, constantWeight: constantWeight)
        let yesChoice = FindMaxValueWithConstantWeight(chooseIndex: chooseIndex - 1, constantWeight: constantWeight - weightArray[chooseIndex]) + valueArray[chooseIndex]
        result = max(noChoice, yesChoice)
        
    }
    variablePairsDoubleArray[constantWeight][chooseIndex] = result
    return result
    
}

FindMaxValueWithConstantWeight(chooseIndex: 5, constantWeight: 10)
print(variablePairsDoubleArray)
