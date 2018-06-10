//: Playground - noun: a place where people can play

import UIKit

var time = 0.1

var line : String?

let linesArray = [["start": 0.0 , "end": 1.0, "line": "seanlin"], ["start": 1.01 , "end": 3.0, "line": "stephencurry"], ["start": 3.01 , "end": 5.0, "line": "klayThompson"], ["start": 5.01 , "end": 100.0, "line": "kobebraynt"]]



func switchArray(dictionaryArray : [[String: AnyObject]]) {
    var x = 0
    
    repeat {
        
        if time > dictionaryArray[x]["start"] as! Double && time < dictionaryArray[x]["end"] as! Double {
            line = dictionaryArray[x]["line"] as? String
        }
        x += 1
        
    } while (x < dictionaryArray.count)
    
    print(line)

}

switchArray(dictionaryArray: linesArray as [[String : AnyObject]])

time = 99.3

switchArray(dictionaryArray: linesArray as [[String: AnyObject]])


func checktime() {
switch (time) {
    
case _ where time > 0 && time < 1:
    print("yo man")
case _ where time > 1 && time < 2:
    print("hellohihi")
    
default: break
    }
}

time = 1.2