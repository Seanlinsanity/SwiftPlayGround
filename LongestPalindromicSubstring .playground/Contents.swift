import UIKit

/*
 Given a string s, return the longest
 palindromic
  
 substring
  in s.

  

 Example 1:

 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:

 Input: s = "cbbd"
 Output: "bb"
  

 Constraints:

 1 <= s.length <= 1000
 s consist of only digits and English letters.
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        if chars.count == 1 { return s }
        if chars.count == 2 { return chars[0] == chars[1] ? s : String(chars[0]) }

        var maxLength = 1
        var maxStart = 0
        var maxEnd = 0
        var dp = Array(repeating: Array(repeating: false, count: chars.count), count: chars.count)
        for index in 0..<chars.count {
            dp[index][index] = true
        }

        for row in stride(from: chars.count - 2, through: 0, by: -1) {
            for column in row + 1..<chars.count {
                let start = row
                let end = column
                if chars[start] == chars[end] {
                    if end - start == 1 {
                        dp[start][end] = true
                    } else {
                        dp[start][end] = dp[start + 1][end - 1]
                    }
                } else {
                    dp[start][end] = false
                }

                if dp[start][end] && end - start + 1 > maxLength {
                    maxLength = end - start + 1
                    maxStart = start
                    maxEnd = end
                }
            }
        }
        return String(chars[maxStart...maxEnd])
    }
    
    var maxString = ""
    var maxLength = 1
    var dp = [[Int]]()
    func longestPalindrome2(_ s: String) -> String {
        let chars = Array(s)
        maxString = String(chars[0])
        dp = Array(repeating: Array(repeating: 0, count: chars.count), count: chars.count)
        longestPalindromicSubstring(0, chars.count - 1, chars)
        return maxString
    }

    func longestPalindromicSubstring(_ start: Int, _ end: Int, _ chars: [Character]) -> Int {
        if start > end { return 0 }

        if start == end { return 1 }
        
        if dp[start][end] != 0 { return dp[start][end] }
        
        let char1 = chars[start]
        let char2 = chars[end]
        if char1 == char2 {
            let result = 2 + longestPalindromicSubstring(start + 1, end - 1, chars)
            if result > 0  {
                if result > maxLength {
                    maxLength = result
                    maxString = String(Array(chars[start...end]))
                }
                dp[start][end] = result
                return result
            }
        }
        
        longestPalindromicSubstring(start + 1, end, chars)
        longestPalindromicSubstring(start, end - 1, chars)
        dp[start][end] = -chars.count
        return -chars.count
    }
}

Solution().longestPalindrome("babad")
Solution().longestPalindrome("cbbd")
Solution().longestPalindrome("abdbca")
Solution().longestPalindrome("cddpd")
Solution().longestPalindrome("pqr")
Solution().longestPalindrome("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")


Solution().longestPalindrome2("babad")
Solution().longestPalindrome2("cbbd")
Solution().longestPalindrome2("abdbca")
Solution().longestPalindrome2("cddpd")
Solution().longestPalindrome2("pqr")
Solution().longestPalindrome2("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
