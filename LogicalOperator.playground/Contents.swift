//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Logical NOT operator - unary prefix operator

let allowedEntry = false

if !allowedEntry {
    print("ACCESS DENIED")
}

let enterDoorCode = true
let passedRetinaScan = false
let iAmFederer = true

if enterDoorCode && passedRetinaScan || iAmFederer
{
    print("Welcome")
}else{
    print("ACESS DENIED AGAIN")
}

let hasDoorKey = false
let knowOverridePassword = true
if hasDoorKey || knowOverridePassword {
    print("Welcome back!")
}
