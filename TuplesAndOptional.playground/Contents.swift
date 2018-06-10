//: Playground - noun: a place where people can play

import UIKit

let regularVariable = 1
let person = ("Stephen", "Derrick", "Ray", "Lebron")
//print(person.0, person.1, person.2)

let p = (firstName: "Stephen", LastName: "Curry")
//print(p.firstName, p.LastName)

func divide(x: Int, y: Int) -> (Int, Int) {
    
    let quotient = x / y
    let remainder = x % y
    
    return (quotient, remainder)
}

divide(x: 10, y: 2)

func topTwoLongestNames(names: [String]) -> (String?, String?) {
    
    if names.isEmpty {
        return (nil, nil)
    }
    
    let sortedList = names.sorted { (x, y) -> Bool in
        return x.count > y.count
    }
    
    if sortedList.count == 1 {
        return (sortedList[0], nil)
    }
    
    return (sortedList[0], sortedList[1])
}

let results = topTwoLongestNames(names: ["Stephen", "Klay", "Kobe", "Nowitzki", "Lebron"])
print(results.0 ?? "nil", results.1 ?? "nil")




