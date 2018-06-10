//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var firstName = "Sean"
var lastName = "Lin"

var age = 45
var fullName = firstName + " " + lastName
var fullName2 = "\(firstName) \(lastName) is age \(age)."

fullName.append(" cool")

var bookTitle = "revenge of the crab cakes"

bookTitle = bookTitle.capitalized

var chatroomAnnoyingCapsGuy = "PLEASE HELP ME NOW! HERE IS MY 100 LINES OF CODE"

var lowercasedChat = chatroomAnnoyingCapsGuy.lowercased()

//Oh My Heck, Fetch

var sentence = "What the fetch?! Heck that is crazy!"

if sentence.contains("fetch") || sentence.contains("Heck"){
    sentence.replacingOccurrences(of: "fetch", with: "fat")
    sentence.replacingOccurrences(of: "Heck", with: "Hey man")
}