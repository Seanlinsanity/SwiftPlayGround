//: Playground - noun: a place where people can play

import UIKit

let duration = "PT4M3S"

let newDuration = duration.replacingOccurrences(of: "PT", with: "")

let DurationNum = newDuration.replacingOccurrences(of: "S", with: "")

let ToTime = DurationNum.components(separatedBy: "M")

print(ToTime[0])

print(ToTime[1])

