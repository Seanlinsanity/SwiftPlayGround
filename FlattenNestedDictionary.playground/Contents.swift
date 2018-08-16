//: Playground - noun: a place where people can play

import UIKit

//input:  dict = {
//    "Key1" : "1",
//    "Key2" : {
//        "a" : "2",
//        "b" : "3",
//        "c" : {
//            "d" : "3",
//            "e" : {
//                "" : "1"
//            }
//        }
//    }
//}
//
//output: {
//    "Key1" : "1",
//    "Key2.a" : "2",
//    "Key2.b" : "3",
//    "Key2.c.d" : "3",
//    "Key2.c.e" : "1"
//}

func flatternDictionary(dictionary: [String: Any]) -> [String: String] {
    
    let resultDict = flatterDictionaryWithKey(dictionary: dictionary, key: "")
    
    
    return resultDict
}

func flatterDictionaryWithKey(dictionary: [String: Any], key: String) -> [String: String]{
    
    var resultDict = [String: String]()
    
    for (oldkey, value) in dictionary {
        if oldkey == ""{
            var keyCharacters = Array(key.characters)
            keyCharacters.removeLast()
            let newKey = String(keyCharacters)
            resultDict[newKey] = String(describing: value)
        }else if value is String || value is Int {
            let newKey = key + oldkey
            resultDict[newKey] = String(describing: value)
        }else if value is [String: Any]{
            let newKey = key + oldkey + "."
            let result = flatterDictionaryWithKey(dictionary: value as! [String: Any], key: newKey)
            
            for (resultKey, resultValue) in result {
                resultDict[resultKey] = resultValue
            }
        }
        
    }
    
    return resultDict
    
}

let testDict: [String: Any] = [ "Key1" : "1",
                                "Key2" : [
                                    "a" : "2",
                                    "b" : "3",
                                    "c" : [
                                        "d" : "3",
                                        "e" : [ "" : "1" ]
                                    ]
    ]
]

print(flatternDictionary(dictionary: testDict))











