//: Playground - noun: a place where people can play

import UIKit

// [1, [2, [3, 4]]] -> [1, 2, 3, 4]

//var myFlattenArray = [Any]()

func flattenArray(nestedArray: [Any]) -> [Int] {
    
    var myFlattenArray = [Int]()
    for element in nestedArray {
        
        if element is Int {
            print(element)
            myFlattenArray.append(element as! Int)
        }else if element is [Any] {
            let nestedElement = element as! [Any]
            let recursionResult = flattenArray(nestedArray: nestedElement)
            for num in recursionResult {
                myFlattenArray.append(num)
            }
            
//            flattenArray(nestedArray: nestedElement)
//            let nestedElement = element as! [Int]
//            for num in nestedElement{
//                myFlattenArray.append(num)
//            }
        }
    }
    
    return myFlattenArray
}

let result = flattenArray(nestedArray: [1, [11, 30], [2, [3, [4, 5]]]])
print("Result:",result)

