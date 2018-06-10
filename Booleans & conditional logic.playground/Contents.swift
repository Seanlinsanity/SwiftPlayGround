//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var amITheBestTeacherEver: Bool = true

amITheBestTeacherEver = false

if true == false || true == true {
    print("WTFish")
}
var hasDataFinishedDownloading : Bool = false

//...

if !hasDataFinishedDownloading {
    print("Loading data...")
}

//...
//...

hasDataFinishedDownloading = true
//Load UI and other app features



// Equal to: ==
// Not equal to: !=
// Greater than: >
// Greater than or equal to: >=
// Less than or equal to: <=

var bankBalance = 400
var itemBuy = 400

if bankBalance >= itemBuy {
    print("purchase item")
}else{
    print("U are broke as a shit")
}

if bankBalance == itemBuy {
    print("Hey buddy, ur balance is 0 now")
}


var amIAtZero = bankBalance == itemBuy

var booktitle1 = "Swift justgood"
var booktitle2 = "Swift justgood"

if booktitle1 != booktitle2{
 print("Need to fix spelling before launching")
} else if  booktitle2.characters.count > 10 {
    print("find a new title for the book")
}
else{
    print("Book looks great send to printer")
}

