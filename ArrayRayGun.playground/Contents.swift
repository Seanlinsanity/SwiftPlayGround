//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var employee1Salary = 45000.0
var employee2Salary = 54000.0
var employee3Salary = 30000.0
var employee4Salary = 11000.0


var employeeSalaries: [Double] = [ 45000.0, 54000.0, 30000.0, 11000.0]

print(employeeSalaries.count)

employeeSalaries.append(24000.0)

print(employeeSalaries.count)

employeeSalaries.remove(at: 1)

print(employeeSalaries.count)

var students = [String]()

print(students.count)

var students2 = [String]()

students2.append("Stephen Curry")
students2.append("Klay Thompson")
students2.append("Kobe Bryant")
students2.append("Andrew Igudala")

students2.remove(at: 2)

print(students2)


//Array Exercise

var ray1 = [String] ()
var ray2 : [Double] = [30, 11, 24, 20]

var ray = ["Curry", "Thompson", "Allen", "Sean"]

ray1.append("WTF")
ray1.append("QQ")
ray2.append(17)
ray2.append(34)

ray2.remove(at: 4)

ray1.removeAll()

ray2.index(of :34)

print(ray2)
print(ray1)

//Alternating Arrays


func alternatingArrays (array1: [String], array2: [String]) -> [String] {
    
    var combineArray = [String]()
    let maxIndex = array1.count >= array2.count ? array1.count : array2.count
    
    for i in 0..<maxIndex{
        if array1.count > i {
            
            combineArray.append(array1[i]) }
        
        if array2.count > i {
            combineArray.append(array2[i]) }
        
    }
    
    return combineArray
}

var result = alternatingArrays(array1: ["What", "The", "Fish"], array2: ["What's", "Up", "Man"])





