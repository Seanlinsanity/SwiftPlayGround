//: Playground - noun: a place where people can play

import UIKit

var sampleSentence = "Hello welcome to the world of swift coding"

func reverseWordsInSentence(sentence: String) -> (String){
    
    let allWords = sentence.components(separatedBy: " ")
    var newSentence = ""
    
    for index in 0...allWords.count - 1 {
        let word = allWords[index]
        
        if newSentence != "" {
            newSentence += " "
        }
        
        if index % 2 == 1{
            let character = word.characters.count
            print(character)
            let reverseWord = String(word.characters.reversed())
            newSentence += reverseWord.stringByRemoveVowels()
        }else{
            newSentence += word.stringByRemoveVowels()
        }
    }
    return newSentence
}

print(reverseWordsInSentence(sentence: sampleSentence))


extension String {
    
    func stringByRemoveVowels() -> String {
        
        var newWord = self
        for i in ["a", "e", "i", "o", "u"]{
        
            newWord = newWord.replacingOccurrences(of: i, with: "")
        
        }
        return newWord
    }
}
