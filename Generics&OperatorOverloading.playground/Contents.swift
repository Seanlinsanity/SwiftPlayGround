//: Playground - noun: a place where people can play

import UIKit

drand48()

func findIndexofItemInArray<T: Comparable>(array: [T], item: T) -> Int? {
    
    if let index = array.index(of: item) {
        return index
    }
    
    return nil
    
}

func checkItemInArray<T: Equatable>(array: [T], item: T) -> Bool {
    
    if array.contains(item) {
        return false
    }
    
    return false
}

let intArray = [1, 3, 5, 7]
let intItem = 7
print(findIndexofItemInArray(array: intArray, item: intItem) ?? "Item doesn't exist")
checkItemInArray(array: intArray, item: intItem)

let stringArray = ["Stephen", "Kobe", "Harden", "Klay"]
let stringItem = "Sean"

print(findIndexofItemInArray(array: stringArray, item: stringItem) ?? "Item doesn't exist")

let doubleArray: [Double] = [1.314, 3.2, 4.16]
let doubleItem = 3.2

print(findIndexofItemInArray(array: doubleArray, item: doubleItem) ?? "Item doesn't exist")


class Person: Equatable {
    
    let name: String
    let sex: String
    
    init(name: String, sex: String){
        self.name = name
        self.sex = sex
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        if lhs === rhs {
            return true
        }else{
            return false
        }
    }
    
}

let sean = Person(name: "Sean", sex: "male")
let jessica = Person(name: "Jessica", sex: "female")

let personArr = [sean, jessica]
print(personArr.index(of: Person(name: "Lin", sex: "male")) ?? "nil")

func * (lhs: String, rhs: Int) -> String {
    var result = lhs
    for _ in 2...rhs {
        result += lhs
    }
    return result
}

print("Sean" * 5)

//protocol Type {
//    static func +(lhs: Self, rhs: Self) -> Self
//}
//extension Int: Type{}
//extension String: Type{}
//func *<T: Type>(lhs: T, rhs: Int) -> T {
//
//    var result = lhs
//    for _ in 2...rhs {
//        result = result + lhs
//    }
//
//    return result
//}
//
//print("2" * 5)


