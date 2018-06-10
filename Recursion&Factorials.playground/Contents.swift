//: Playground - noun: a place where people can play

import UIKit

func recursiveFactorialOfValue(value: Int) -> Int {
    
    if value == 0 {
        return 1
    }
    
    print(value)
    
    return value * recursiveFactorialOfValue(value: value - 1)
    
}

recursiveFactorialOfValue(value: 5)