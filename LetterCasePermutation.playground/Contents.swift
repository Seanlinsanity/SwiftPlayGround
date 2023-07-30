import UIKit

/*
 Given a string s, you can transform every letter individually to be lowercase or uppercase to create another string.

 Return a list of all possible strings we could create. Return the output in any order.

  

 Example 1:

 Input: s = "a1b2"
 Output: ["a1b2","a1B2","A1b2","A1B2"]
 Example 2:

 Input: s = "3z4"
 Output: ["3z4","3Z4"]
  

 Constraints:

 1 <= s.length <= 12
 s consists of lowercase English letters, uppercase English letters, and digits.
 */

class Solution {
    var result = [String]()
    func letterCasePermutation(_ str: String) -> [String] {
        letterCasePermutation("", Array(str))
        return result
    }

    func letterCasePermutation(_ currentStr: String, _ chars: [Character]) {
        if currentStr.count == chars.count {
            result.append(currentStr)
            return
        }

        let currentIndex = currentStr.count
        let char = chars[currentIndex]
        let charString = String(char)
        if char.isNumber {
            letterCasePermutation(currentStr + charString, chars)
        } else {
            letterCasePermutation(currentStr + charString.uppercased(), chars)
            letterCasePermutation(currentStr + charString.lowercased(), chars)
        }
    }
}

Solution().letterCasePermutation("a1b2")
Solution().letterCasePermutation("3z4")
