//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Shape1
var length = 5
var width = 8

var area = length * width

//Shape2
var length2 = 6
var width2 = 9

var area2 = length2 * width2

//Shape3
var length3 = 9
var width3 = 3

var area3 = length3 * width3

func calculateArea(length: Int, width: Int) -> Int {

    return length * width
}

let newArea = calculateArea(length: 5, width: 4)
let newshape1 = calculateArea(length: 6, width: 2)
let newshape2 = calculateArea(length: 9, width: 3)

var bankAccountBalance = 1000.00
var awesomeNikeShoes = 300.00

func purchaseItem(currentBalance: Double, itemPrice: Double) -> Double{
    if itemPrice <= currentBalance{
        print("Purchase itme for : $\(itemPrice)")
        return currentBalance - itemPrice
    }else{
        print("U are broke as a joke.")
        return currentBalance
    }
}

bankAccountBalance = purchaseItem(currentBalance: bankAccountBalance, itemPrice: awesomeNikeShoes)

var UAShoes = 120.00

bankAccountBalance = purchaseItem(currentBalance: bankAccountBalance, itemPrice: UAShoes)


func purchaseItem2(currentBalance: inout Double, itemPrice: Double) {
    if itemPrice <= currentBalance{
        currentBalance = currentBalance - itemPrice
        print("Purchase itme for :\(itemPrice)")
    }else{
        print("U are broke as a joke.")
    }
}

purchaseItem2(currentBalance: &bankAccountBalance, itemPrice: awesomeNikeShoes)
purchaseItem2(currentBalance: &bankAccountBalance, itemPrice: UAShoes)


//Funciton Exercise

var num1: Double = 30
var num2 = 11.0
var num3 = 24.0

func add(number1: inout Double, number2: Double)  {
    number1 = number1 + number2
}

add(number1: &num1, number2: num2)
add(number1: &num1, number2: num3)


