import UIKit

/*
 Given two strings 's1' and 's2', find the length of the longest substring which is common in both the strings.

 Example 1:

 Input: s1 = "abdca"
        s2 = "cbda"
 Output: 2
 Explanation: The longest common substring is "bd".
 Example 2:

 Input: s1 = "passport"
        s2 = "ppsspt"
 Output: 3
 Explanation: The longest common substring is "ssp".
 */

class Solution {
    var cache = [[Int]]()
    var result = 0
    func longestSubstring(_ s1: String, _ s2: String) -> Int {
        cache = Array(repeating: Array(repeating: -1, count: s2.count), count: s1.count)
        longestSubstring(0, 0, Array(s1), Array(s2))
        return result
    }

    func longestSubstring(_ index1: Int, _ index2: Int, _ chars1: [Character], _ chars2: [Character]) -> Int {
        if index1 >= chars1.count || index2 >= chars2.count {
            return 0
        }

        if cache[index1][index2] > -1 {
            return cache[index1][index2]
        }

        let char1 = chars1[index1]
        let char2 = chars2[index2]
        var length = 0
        if char1 == char2 {
            length = 1 + longestSubstring(index1 + 1, index2 + 1, chars1, chars2)
            result = max(length, result)
        }
        
        longestSubstring(index1 + 1, index2, chars1, chars2)
        longestSubstring(index1, index2 + 1, chars1, chars2)
        cache[index1][index2] = length
        return length
    }
    
    func longestSubstring2(_ s1: String, _ s2: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
        let chars1 = Array(s1)
        let chars2 = Array(s2)
        for row in stride(from: s1.count - 1, through: 0, by: -1) {
            for column in stride(from: s2.count - 1, through: 0, by: -1) {
                if chars1[row] == chars2[column] {
                    let length = 1 + dp[row + 1][column + 1]
                    result = max(length, result)
                    dp[row][column] = length
                }
            }
        }
        return result
    }
}

Solution().longestSubstring("abdca", "cbda")
Solution().longestSubstring("passport", "ppsspt")
Solution().longestSubstring("0000001000", "0000000100")


Solution().longestSubstring2("abdca", "cbda")
Solution().longestSubstring2("passport", "ppsspt")
Solution().longestSubstring2("0000001000", "0000000100")
