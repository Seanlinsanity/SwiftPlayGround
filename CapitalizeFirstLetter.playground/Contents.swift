//: Playground - noun: a place where people can play

import UIKit

//func captializeFirstLetter(theString: String) -> String {
//
//    let words = theString._split(separator: " ")
//    var newWords = [String]()
//
//    for word in words {
//        var characters = Array((word.characters))
//        let firstCharacter = String(characters[0]).uppercased()
//        characters.remove(at: 0)
//
//        var newWord = firstCharacter
//        for character in characters {
//            newWord += String(character)
//        }
//
//        newWords.append(newWord)
//    }
//
//    let result = newWords.joined(separator: " ")
//
//
//    return result
//}
//
//print(captializeFirstLetter(theString: "look, it is working!"))


func captializeFirstLetter(theString: String) -> String {
    
    let words = theString.components(separatedBy: " ")
    var newWords = [String]()
    
    for word in words {
        let newWord = word.capitalized
        newWords.append(newWord)
    }
    
    let result = newWords.joined(separator: " ")
    
    return result
}

print(captializeFirstLetter(theString: "look, it is working!"))
