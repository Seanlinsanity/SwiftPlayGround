import UIKit

/*
 Given a string s and an integer k, return the length of the longest substring of s such that the frequency of each character in this substring is greater than or equal to k.

 if no such substring exists, return 0.

  

 Example 1:

 Input: s = "aaabb", k = 3
 Output: 3
 Explanation: The longest substring is "aaa", as 'a' is repeated 3 times.
 Example 2:

 Input: s = "ababbc", k = 2
 Output: 5
 Explanation: The longest substring is "ababb", as 'a' is repeated 2 times and 'b' is repeated 3 times.
  

 Constraints:

 1 <= s.length <= 104
 s consists of only lowercase English letters.
 1 <= k <= 105
 */


class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)
        var charSet = Set<Character>()
        for char in chars {
            charSet.insert(char)
        }

        let uniqueCharCount = charSet.count

        var result = 0
        for unique in 1...uniqueCharCount {
            var left = 0
            var right = 0
            var charCountDict = [Character: Int]()
            var uniqueCount = 0
            while right < chars.count {
                let char = chars[right]
                let count = charCountDict[char, default: 0] + 1
                charCountDict[char] = count
                if count == 1 {
                    uniqueCount += 1
                }

                while uniqueCount > unique {
                    let leftChar = chars[left]
                    let leftCount = charCountDict[leftChar, default: 0] - 1
                    charCountDict[leftChar] = leftCount
                    if leftCount == 0 {
                        uniqueCount -= 1
                    }
                    left += 1
                }

                if isAllCharsAtLeastK(charCountDict, k) {
                    result = max(result, right - left + 1)
                }

                right += 1
            }
        }
        return result
    }

    private func isAllCharsAtLeastK(_ dict: [Character: Int], _ k: Int) -> Bool {
        for value in dict.values {
            if value > 0 && value < k {
                return false
            }
        }
        return true
    }
}

Solution().longestSubstring("aaabb", 3)
Solution().longestSubstring("ababbc", 2)
Solution().longestSubstring("bbaaacbd", 3)
