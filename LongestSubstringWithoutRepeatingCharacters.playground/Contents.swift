import UIKit
/*
Given a string, find the length of the longest substring without repeating characters.

Example 1:

Input: "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Example 2:

Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    var start = 0
    var lastOccuredDict = [Character: Int]()
    var maxLength = 0
    let characters = Array(s)
    
    if characters.count < 1 {
        return 0
    }
    
    for i in 0...characters.count - 1 {
        if let lastOcuuredIndex = lastOccuredDict[characters[i]] {
            if (lastOcuuredIndex >= start) {
                start = lastOcuuredIndex + 1
            }
        }
        
        if (i - start + 1 > maxLength) {
            maxLength = i - start + 1
        }
        
        lastOccuredDict[characters[i]] = i
    }
    
    return maxLength
}

lengthOfLongestSubstring("abcabcbb")
lengthOfLongestSubstring("bbbbb")
lengthOfLongestSubstring("pwwkew")

