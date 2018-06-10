//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var employee1Salary = 45000.0
var employee2Salary = 100000.0
var employee3Salary = 54000.0
var employee4Salary = 20000.0

employee1Salary = employee1Salary + (employee1Salary * 0.10)
employee2Salary = employee2Salary + (employee2Salary * 0.10)
employee3Salary = employee3Salary + (employee3Salary * 0.10)
employee4Salary = employee4Salary + (employee4Salary * 0.10)


//Better way

var salaries = [45000.0,100000.0,54000.0,20000.0]

salaries[0] = salaries[0] + (salaries[0] * 0.10)


var x=0
repeat {
    
    salaries[x] = salaries[x] + (salaries[x] * 0.10)
    x += 1 // x = x+1
    
} while (x < salaries.count)


//More short code
for x in 1...5 //includes 1 and 5
{
    print("Index: \(x)")
}


for x in 1..<5{
    print("Index: \(x)")
}

for i in 0..<salaries.count{
    salaries[i] = salaries[i] + (salaries[i] * 0.10)
}


for eachElement in salaries //eachElement這項可以自由設定，都代表array中的每一項
{
    print("Salary: \(eachElement)")
}

//Loop Exercise

var OddNumbers = [Int]()

for x in 0..<50 {
    OddNumbers.append( 2 * x + 1)
    
}

var count = OddNumbers.count
print(OddNumbers)

var Sums = [Int]() // or var Sums : [Int] = []

for x in 0..<OddNumbers.count {
    Sums.append(OddNumbers[x]+5)
}

var count2 = Sums.count

var z=0
repeat {
    print("The sum is : \(Sums[z])")
    z += 1
} while  (z < Sums.count)






