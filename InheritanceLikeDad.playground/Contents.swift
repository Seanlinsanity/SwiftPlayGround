//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Vehicle {
    var tires = 4
    var make: String?
    var model: String?
    var currentSpeed: Double = 0
    
    init() {
        print("I AM THE Parent")
    }
    
    func drive(speedIncrease: Double){
    currentSpeed += speedIncrease * 2
        
    }
    func brake(){
    }
}

class SportsCar : Vehicle //SportsCar inherit by vehicle
{
    override init() {
        super.init()
        print("I AM THE CHILD")
        make = "BMW"
        model = " 3 series"
    }
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 3
    }
}

let Car = SportsCar()

class Truck: Vehicle{
    override init() {
        super.init()
    }
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease
    }
}

let Car2 = Truck()

