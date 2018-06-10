//: Playground - noun: a place where people can play

import UIKit

var time: Double
var text: String

time = -1.0
text = ""

func checkTime () {
switch time {
case let t where t < -1 :
    text = "Hello"
    print(text)
case let x where x < 0 :
    text = "YoYo"
    print(text)
default:
    print("this is impossible")
}
}

time = 5

checkTime()

time = -1

checkTime()

time = -0.5

checkTime()


