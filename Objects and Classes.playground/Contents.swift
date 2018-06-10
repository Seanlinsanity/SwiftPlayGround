//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Vehicle {
    var tires = 4
    var head = 2
    var horsepower = 468
    var model = ""
    
    func drive() {
    // accelerate the vehicle
    }
    
    func brake() {
        
    }
    
}

let bmw = Vehicle() //instantiate , becoming an object

bmw.model = "328i"

let ford = Vehicle()

ford.model = "F150"

ford.brake()

func funcFunction(vehicle: Vehicle){
    vehicle.model = "cheese"
    
}

print(ford.model)

funcFunction(vehicle: ford) //pass by reference (object), can not copy an object

print(ford.model)

var someOnesAge = 20

func passByValue(age: Int){
    let newAge = age
}

passByValue(age: someOnesAge)
