//: Playground - noun: a place where people can play

import UIKit

func mostCommonNameInNames(_ names: [String]) -> String {
    
    var nameCountDictionary = [String: Int]()
    
    for name in names {
        if let count = nameCountDictionary[name] {
            nameCountDictionary[name] = count + 1
        }else{
            nameCountDictionary[name] = 1
        }
    }
    
    var mostCommonName = ""
    
    for key in nameCountDictionary.keys {
        
        if mostCommonName == "" {
            mostCommonName = key
        }else{
            let count = nameCountDictionary[key]!
            if count > nameCountDictionary[mostCommonName]!{
                mostCommonName = key
            }
        }
        
        print("\(key):\(nameCountDictionary[key]!)")
    }
    print(mostCommonName)
    
    return mostCommonName
}

let names = ["Sean", "Stephen", "James","Jacky","Parker","Klay","Jacky", "James","Kobe", "Jacky", "James","Allen", "James"]

mostCommonNameInNames(names)
