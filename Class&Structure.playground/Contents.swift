//: Playground - noun: a place where people can play

import UIKit

class Macbook {
    
    var year: Int
    var type: String
    
    init(year: Int, type: String) {
        self.year = year
        self.type = type
    }
}

let myMacbook = Macbook(year: 2015, type: "Air")
let brainMacbook = myMacbook

brainMacbook.year = 2017
print(myMacbook.year)

struct iPhone {
    
    var type: Int
    var color: String
}

let myiPhone = iPhone(type: 4, color: "piano black")
var brainPhone = iPhone(type: 10, color: "space silver")
var newiPhone = myiPhone
newiPhone.type = 7
print(myiPhone.type)
