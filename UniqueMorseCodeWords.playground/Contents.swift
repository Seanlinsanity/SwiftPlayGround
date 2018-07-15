
//: Playground - noun: a place where people can play

import UIKit

//International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.
//
//For convenience, the full table for the 26 letters of the English alphabet is given below:
//
//[".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
//Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cab" can be written as "-.-.-....-", (which is the concatenation "-.-." + "-..." + ".-"). We'll call such a concatenation, the transformation of a word.
//
//Return the number of different transformations among all words we have.
//
//Example:
//Input: words = ["gin", "zen", "gig", "msg"]
//Output: 2
//Explanation:
//The transformation of each word is:
//"gin" -> "--...-."
//"zen" -> "--...-."
//"gig" -> "--...--."
//"msg" -> "--...--."
//
//There are 2 different transformations, "--...-." and "--...--.".

let morseTable = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
let aScalars = "a".unicodeScalars
let aCode = aScalars[aScalars.startIndex].value

let words = ["gin", "zen", "gig", "msg"]

func numbersOfmorseCode(words: [String]) -> Int {
    
    var morseCodeDictionary = [String: Int]()
    
    for word in words {
        var morseCode = ""
        let characters = Array(word)
        
        for character in characters{
            let scalars = character.unicodeScalars
            let code = scalars[scalars.startIndex].value
            
            morseCode += morseTable[Int(code) - Int(aCode)]
        }
        
        print(morseCode)
        morseCodeDictionary[morseCode] = 1
    }
    
    return morseCodeDictionary.keys.count
}

print(numbersOfmorseCode(words: words))















