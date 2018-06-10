//: Playground - noun: a place where people can play

import UIKit

//N is the number of steps
//Step Limit = [1, 2]

func numberOfWays(numberOfSteps: Int) -> Int {
    
    if numberOfSteps == 1{
        return 1
    }else if numberOfSteps == 2 {
        return 2
    }
    
    return numberOfWays(numberOfSteps: numberOfSteps - 1) + numberOfWays(numberOfSteps:  numberOfSteps - 2)
}

numberOfWays(numberOfSteps: 10)

func bottomUpNumberOfWays(numberOfSteps: Int) -> Int {
    
    if numberOfSteps == 0{
        return 1
    }else if numberOfSteps == 1 {
        return 1
    }
    
//    var numsDictionary = [Int : Int]()
//
//    numsDictionary[0] = 1
//    numsDictionary[1] = 1
//
//    for i in 2...numberOfSteps{
//        numsDictionary[i] = numsDictionary[i - 1]! + numsDictionary[i - 2]!
//    }
//
//    return numsDictionary[numberOfSteps]!
    
    var nums = [Int](repeating: 0, count: numberOfSteps + 1)
    nums[0] = 1
    nums[1] = 1

    for i in 2...numberOfSteps{
        nums[i] = nums[i - 1] + nums [i - 2]
    }

    return nums[numberOfSteps]
}

bottomUpNumberOfWays(numberOfSteps: 10)


// Step Limit = [1, 3, 5]
func numberOfWaysWithStepsLimits(numberOfSteps: Int) -> Int{
    
    if numberOfSteps == 0 {
        return 1
    }
    
    var nums = [Int](repeating: 0, count: numberOfSteps + 1)
    nums[0] = 1
    
    for i in 1...numberOfSteps{
        var total = 0

        for j in [1, 3, 5]{
            
            if i - j >= 0 {
                total += nums[i - j]
            }
            nums[i] = total
        }
        
    }
    return nums[numberOfSteps]
}

numberOfWaysWithStepsLimits(numberOfSteps: 5)





