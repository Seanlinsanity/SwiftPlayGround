import UIKit

/*
 Given two strings word1 and word2, return the minimum number of steps required to make word1 and word2 the same.

 In one step, you can delete exactly one character in either string.

  

 Example 1:

 Input: word1 = "sea", word2 = "eat"
 Output: 2
 Explanation: You need one step to make "sea" to "ea" and another step to make "eat" to "ea".
 Example 2:

 Input: word1 = "leetcode", word2 = "etco"
 Output: 4
  

 Constraints:

 1 <= word1.length, word2.length <= 500
 word1 and word2 consist of only lowercase English letters.
 */

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let lcs = longestCommonSubsequence(word1, word2)
        return (word1.count - lcs) + (word2.count - lcs)
    }

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let chars1 = Array(text1)
        let chars2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: text1.count + 1), count: text2.count + 1)
        for row in stride(from: text2.count - 1, through: 0, by: -1) {
            for column in stride(from: text1.count - 1, through: 0, by: -1) {
                let char1 = chars1[column]
                let char2 = chars2[row]
                if char1 == char2 {
                    dp[row][column] = 1 + dp[row + 1][column + 1]
                } else {
                    dp[row][column] = max(dp[row + 1][column], dp[row][column + 1])
                }
            }
        }

        return dp[0][0]
    }
}

Solution().minDistance("sea", "eat")
Solution().minDistance("leetcode", "etco")
