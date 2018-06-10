//: Playground - noun: a place where people can play

import UIKit

protocol Vehicle: CustomStringConvertible {
    
    var isRunning : Bool { get set }
    var make: String { get set }
    var model: String { get set }
    

    
}

extension Vehicle {
    
    var makeModel: String{
        return "\(make) \(model)"
    }
    
    mutating func start(){
        if isRunning {
            print("Already Running")
        }else{
            isRunning = true
            print("\(self.description) fire up!")
        }
        
    }
    
    mutating func turnOff(){
        if isRunning {
            isRunning = false
            print("\(self.description) shut down!")
        }
    }
}

struct SportsCar : Vehicle{
    
    var isRunning: Bool  = false
    var make: String
    var model: String
    
    var description: String{
       return self.makeModel
    }
}

class SemiTruck : Vehicle {
    
    var isRunning: Bool = false
    var make: String
    var model: String
    
    
    //In class type, you have to initilize the var
    init(isRunning: Bool, make: String, model: String) {
        self.isRunning = isRunning
        self.make = make
        self.model = model
    }
    
    var description: String{
        return self.makeModel
    }

    //class => "mutating" key word is not needed here
  
    
    func blowAirHorn(){
        print("What the Duckkkkk!")
    }
}


var car1 = SportsCar(isRunning: false, make: "BMW", model: "191")
var truck1 = SemiTruck(isRunning: false, make: "Toyota", model: "S4U0")

car1.start()
truck1.start()
truck1.blowAirHorn()

truck1.turnOff()

var vehicleArray: [Vehicle] = [car1, truck1]
for i in vehicleArray {
    
    print("\(i.description)")
    
    if let vehicle = i as? SemiTruck{
        print("\(vehicle.makeModel)")
    }
}

extension Double {
    var dollarString: String{
        return String(format: "$%.02f", self)
    }
}

var pct = 32.14 * 198.1
pct.dollarString


//Generic

func intAdder(number: Int) -> Int {
    return number + 1
}

intAdder(number: 15)

func DoubleAdder(number: Double) -> Double{
    return number + 1
}

DoubleAdder(number: 15)

func genericAdder<T: Strideable>(number: T) -> T{

    return number + 1
}

genericAdder(number: 15)

func intMutliplier(lhs: Int, rhs: Int) -> Int {
    return lhs * rhs
}

intMutliplier(lhs: 132, rhs: 413)

func DoubleMutliplier(lhs: Double, rhs: Double) -> Double {
    return lhs * rhs
}

DoubleMutliplier(lhs: 132.0, rhs: 413.0)

protocol Numeric {
    static func *(lhs: Self, rhs: Self) -> Self
}

extension Double: Numeric{}
extension Int: Numeric{}
extension Float: Numeric{}

func genericMultiplier<T: Numeric>(lhs: T, rhs: T) -> T {
    return lhs * rhs
}

genericMultiplier(lhs: 5, rhs: 5)
genericMultiplier(lhs: 3.14, rhs: 8791.1)


