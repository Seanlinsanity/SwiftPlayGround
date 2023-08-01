import UIKit

/*
 Given a string s, find the longest palindromic subsequence's length in s.

 A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

  

 Example 1:

 Input: s = "bbbab"
 Output: 4
 Explanation: One possible longest palindromic subsequence is "bbbb".
 Example 2:

 Input: s = "cbbd"
 Output: 2
 Explanation: One possible longest palindromic subsequence is "bb".
  

 Constraints:

 1 <= s.length <= 1000
 s consists only of lowercase English letters.
 */

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        // edge case
        if s.count == 1 { return 1 }

        let chars = Array(s)
        var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        for i in 0..<s.count {
            dp[i][i] = 1
        }

        for row in 0..<s.count {
            for column in stride(from: row - 1, through: 0, by: -1) {
                if row > column {
                    let endChar = chars[row]
                    let startChar = chars[column]
                    if endChar == startChar {
                        dp[row][column] = 2 + dp[row - 1][column + 1]
                    } else {
                        dp[row][column] = max(dp[row - 1][column], dp[row][column + 1])
                    }
                }
            }
        }

        return dp[s.count - 1][0]
    }
}

Solution().longestPalindromeSubseq("bbbab")
Solution().longestPalindromeSubseq("cbbd")

