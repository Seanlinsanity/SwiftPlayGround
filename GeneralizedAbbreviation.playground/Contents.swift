import UIKit

/*
 Given a word, write a function to generate all of its unique generalized abbreviations.

 A generalized abbreviation of a word can be generated by replacing each substring of the word with the count of characters in the substring. Take the example of “ab” which has four substrings: “”, “a”, “b”, and “ab”. After replacing these substrings in the actual word by the count of characters, we get all the generalized abbreviations: “ab”, “1b”, “a1”, and “2”.

 Note: All contiguous characters should be considered one substring, e.g., we can’t take “a” and “b” as substrings to get “11”; since “a” and “b” are contiguous, we should consider them together as one substring to get an abbreviation “2”.

 Example 1:

 Input: "BAT"
 Output: "BAT", "BA1", "B1T", "B2", "1AT", "1A1", "2T", "3"
 Example 2:

 Input: "code"
 Output: "code", "cod1", "co1e", "co2", "c1de", "c1d1", "c2e", "c3", "1ode", "1od1", "1o1e", "1o2", "2de", "2d1", "3e", "4"
 
 Example 1:

 Input:
 word = "word",
 Output:
 ["word", "1ord", "w1rd", "wo1d", "wor1", "2rd", "w2d", "wo2", "1o1d", "1or1", "w1r1", "1o2", "2r1", "3d", "w3", "4"]

 Input:
 word = "today"
 Output:
 ["1o1a1","1o1ay","1o2y","1o3","1od1y","1od2","1oda1","1oday","2d1y","2d2","2da1","2day","3a1","3ay","4y","5","t1d1y","t1d2","t1da1","t1day","t2a1","t2ay","t3y","t4","to1a1","to1ay","to2y","to3","tod1y","tod2","toda1","today"]
 */

class Solution {
    var abbrevation = Set<String>()
    var current = [Character]()
    func generateAbbreviations(_ word: String) -> [String] {
        // edge case
        if word.count == 0 { return [""] }
        
        unqiueAbbreviations(0, Array(word))
        var uniqueAbbrevations = Set<String>()
        for str in abbrevation {
            let chars = Array(str)
            var newChars = [Character]()
            var count = 0
            var currentIndex = 0
            while currentIndex < str.count {
                if chars[currentIndex] == "1" {
                    count += 1
                } else {
                    if count != 0 {
                        newChars += Array(String(count))
                        count = 0
                    }
                    newChars.append(chars[currentIndex])
                }
                currentIndex += 1
            }

            if count != 0 {
                newChars += Array(String(count))
            }

            uniqueAbbrevations.insert(String(newChars))
        }
        return Array(uniqueAbbrevations)
    }

    // 0, [], [w,o,r,d]
    func unqiueAbbreviations(_ index: Int, _ chars: [Character]) {
        if index == chars.count {
            abbrevation.insert(String(current))
            return
        }
        let char = chars[index]
        current.append(char)
        unqiueAbbreviations(index + 1, chars)
        current.removeLast()
        
        current.append("1")
        unqiueAbbreviations(index + 1, chars)
        current.removeLast()
    }
}

Solution().generateAbbreviations("BAT")
Solution().generateAbbreviations("code")
Solution().generateAbbreviations("word")
Solution().generateAbbreviations("today")