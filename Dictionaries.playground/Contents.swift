//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var namesOfIntegers = [Int: String]()

namesOfIntegers[3] = "Chris Paul"
namesOfIntegers[30] = "Stephen Curry"

namesOfIntegers = [:] //clear all the keys and values

var airports: [String: String] = ["YYZ" : "Toronto Pearson", "LAX": "Los Angeles International"]

print("The airports dictionary has: \(airports.count) items")

if airports.isEmpty {
    print("The airports dictionary is empty !")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
airports["CHY"] = "Chiayi International"

airports["CHY"] = nil // delete the specific key and value


for (airportCode, airportName) // (key, value)
    in airports {
    print("\(airportCode): \(airportName)")
}

for key in airports.keys {
    print("key: \(key)")
}

for val in airports.values {
    print("value: \(val)")
}
