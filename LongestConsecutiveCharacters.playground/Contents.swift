//: Playground - noun: a place where people can play

import UIKit

var str = "AABCDDBBBEAAAAA"

func BettergetLonggestConsecutiveCharacters(str: String) -> ([Character: Int]){

    let charactersArray = Array(str)
    
    var checkCharacter: Character?
    var maxCharacter: Character?
    var maxCount = 0
    var count = 0
    
    charactersArray.forEach { (character) in
        
        if character != checkCharacter {
            count = 1
            
        }else{
            count += 1
        }
        
        if count > maxCount {
            maxCount = count
            maxCharacter = character
        }
        
        checkCharacter = character
    }
    
    return [maxCharacter!: maxCount]
}

BettergetLonggestConsecutiveCharacters(str: str)

var characterDictionary = [Character: Int]()

func getLonggestConsecutiveCharacters(str: String) -> ([Character: Int]){
    
    let charactersArray = Array(str)
    
    var checkCharacter: Character?
    var count = 0
    
    charactersArray.forEach { (character) in
        
        if checkCharacter == nil {
            
            checkCharacter = character
            count = 1
            characterDictionary[character] = count
            
        }else if checkCharacter == character{
            
            count += 1
            if let preCount = characterDictionary[character]{
                if preCount < count {
                    characterDictionary[character] = count
                }
            }
        }else if checkCharacter != character {
            
            checkCharacter = character
            count = 1
            if let preCount = characterDictionary[character]{
                if preCount < count {
                    characterDictionary[character] = count
                }
            }else{
                characterDictionary[character] = count
            }
        }
        
        //print(characterDictionary)
    
    }
    return characterDictionary
}

getLonggestConsecutiveCharacters(str: str)

func getLargestValueInDictionary(dictionary: [Character: Int]){
    
    var largestValue: Int?
    var character: Character?
    
    for key in dictionary.keys {
        
        if largestValue == nil {

            if let value = dictionary[key]{
                largestValue = value
                character = key
            }
            
        }else{
            
            if let value = dictionary[key]{
                if value > largestValue! {
                    largestValue = value
                    character = key
                }
            }
        }
        
    }
    
    print(character,largestValue)

}

getLargestValueInDictionary(dictionary: characterDictionary)




