import UIKit

/*
 Given a string, find the length of the longest substring in it with no more than K distinct characters.

 You can assume that K is less than or equal to the length of the given string.

 Example 1:

 Input: String="araaci", K=2
 Output: 4
 Explanation: The longest substring with no more than '2' distinct characters is "araa".
 Example 2:

 Input: String="araaci", K=1
 Output: 2
 Explanation: The longest substring with no more than '1' distinct characters is "aa".
 Example 3:

 Input: String="cbbebi", K=3
 Output: 5
 Explanation: The longest substrings with no more than '3' distinct characters are "cbbeb" & "bbebi".
 */

class Solution {
    func lengthOfLongestSubstringKDistinct(_ str: String, _ mostK: Int) -> Int {
        // edge case
        if str.count == 0 || mostK == 0 { return 0 }

        let chars = Array(str)
        var charsCountDict = [Character: Int]()
        var result = 0
        var left = 0
        var right = 0
        var distinct = 0
        while right < chars.count {
            let char = chars[right]
            let count = charsCountDict[char, default: 0] + 1
            charsCountDict[char] = count
            if count == 1 {
                distinct += 1
            }

            while distinct > mostK {
                let leftChar = chars[left]
                let leftCharCount = charsCountDict[leftChar, default: 0] - 1
                charsCountDict[leftChar] = leftCharCount
                if leftCharCount == 0 {
                    distinct -= 1
                }
                left += 1
            }

            result = max(result, right - left + 1)
            right += 1
        }
        return result
    }
}

Solution().lengthOfLongestSubstringKDistinct("araaci", 2)
Solution().lengthOfLongestSubstringKDistinct("araaci", 1)
Solution().lengthOfLongestSubstringKDistinct("cbbebi", 3)
