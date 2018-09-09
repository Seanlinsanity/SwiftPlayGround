//: Playground - noun: a place where people can play

import UIKit

func nextFibonacci(_ numbers: [Int]){
    var fibonacciSequence = [1, 1]
    
    for num in numbers {
        if num <= 1 {
            print(2)
        }else if num >= fibonacciSequence[fibonacciSequence.count - 1] {
            while (num >= fibonacciSequence[fibonacciSequence.count - 1]) {
                fibonacciSequence.append(fibonacciSequence[fibonacciSequence.count - 1] + fibonacciSequence[fibonacciSequence.count - 2])
            }
            print(fibonacciSequence[fibonacciSequence.count - 1])
        }else{
            for i in 1...fibonacciSequence.count - 1 {
                if fibonacciSequence[i] > num {
                    print(fibonacciSequence[i])
                    break
                }
            }
        }
    }
}

nextFibonacci([1, 22, 22, 9, 34, 10, 11])

