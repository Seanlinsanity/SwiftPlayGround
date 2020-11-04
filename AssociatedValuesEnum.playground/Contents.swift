import UIKit

var str = "Hello, playground"

enum Package {
    // Nothing 代表沒東西
    case Nothing
    // SomeInteger 可設定1個integer的關聯值
    case SomeInteger(integer:Int)
    // TwoDoubles 可設定2個double的關聯值
    case TwoDoubles(double1: Double, double2: Double)

    // 宣告一個function, 做為判斷關聯值是否為整數值
    // 是 : 回傳 true
    // 否 : 回傳 false
    func containInteger()->Bool{
        switch self{
        case .Nothing:
            print("nothing here")
            return false
        case let .SomeInteger(integer):
            print("some int: \(integer)")
            return true
        case let .TwoDoubles(double1, double2):
            print("two doubles: \(double1), \(double2)")
            return false
        }
    }
    
    func containDescription()->String{
        switch self{
        case .Nothing:
            return "nothing"
        case let .SomeInteger(integer):
            return "int: \(integer)"
        case let .TwoDoubles(double1, double2):
            return "doubles: \(double1), \(double2)"
        }
    }
}


let nothing = Package.Nothing
nothing.containInteger() //false
let integer = Package.SomeInteger(integer: 24)
integer.containInteger() // true
let twoDoubles = Package.TwoDoubles(double1: 11, double2: 30)
twoDoubles.containInteger()

var packages = [Package]()
packages.append(.TwoDoubles(double1: 40.0, double2: 80.0))
packages.append(.SomeInteger(integer: 20))
packages.forEach{ print($0.containDescription()) }
