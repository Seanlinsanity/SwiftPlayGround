//: Playground - noun: a place where people can play

import UIKit

var sentence = "Hello anna kayak anna kayak Civic anna civic"

func allPalindromeCounts(sentence: String) -> [String: Int]{
    
    var counts = [String: Int]()
    
    let words = sentence.components(separatedBy: " ")
    
    words.forEach { (word) in
        //print(word)
        
        if isPalindrome(word: word) {
            
            if let count = counts[word] {
                counts[word] = count + 1
            }else{
                counts[word] = 1
            }
            
            print("Found palindrome:", word)
        }
    
    }
    
    for (key, value) in counts {
        print(key, value)
    }
    
    return counts
}

func isPalindrome(word: String) -> Bool {
    
    let characters = Array(word.lowercased())
    var currentIndex = 0
    
    while currentIndex < characters.count / 2 {
        if characters[currentIndex] != characters[characters.count - currentIndex - 1] {
            return false
        }
        
        currentIndex += 1
    }
    
    return true
}

allPalindromeCounts(sentence: sentence)
