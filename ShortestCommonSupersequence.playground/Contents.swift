import UIKit
/*
 Given two strings str1 and str2, return the shortest string that has both str1 and str2 as subsequences. If there are multiple valid strings, return any of them.

 A string s is a subsequence of string t if deleting some number of characters from t (possibly 0) results in the string s.

  

 Example 1:

 Input: str1 = "abac", str2 = "cab"
 Output: "cabac"
 Explanation:
 str1 = "abac" is a subsequence of "cabac" because we can delete the first "c".
 str2 = "cab" is a subsequence of "cabac" because we can delete the last "ac".
 The answer provided is the shortest such string that satisfies these properties.
 Example 2:

 Input: str1 = "aaaaaaaa", str2 = "aaaaaaaa"
 Output: "aaaaaaaa"
  

 Constraints:

 1 <= str1.length, str2.length <= 1000
 str1 and str2 consist of lowercase English letters.
 */
class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        let chars1 = Array(str1)
        let chars2 = Array(str2)
        var dp = Array(repeating: Array(repeating: "", count: str2.count + 1), count: str1.count + 1)
        for column in 0..<str2.count {
            dp[str1.count][column] = String(chars2[column..<str2.count])
        }

        for row in 0..<str1.count {
            dp[row][str2.count] = String(chars1[row..<str1.count])
        }

        for row in stride(from: str1.count - 1, through: 0, by: -1) {
            for column in stride(from: str2.count - 1, through: 0, by: -1) {
                let char1 = chars1[row]
                let char2 = chars2[column]
                if char1 == char2 {
                    dp[row][column] = String(char1) + dp[row + 1][column + 1]
                } else {
                    if dp[row + 1][column].count < dp[row][column + 1].count {
                        dp[row][column] = String(char1) + dp[row + 1][column]
                    } else {
                        dp[row][column] = String(char2) + dp[row][column + 1]
                    }
                }
            }
        }
        return dp[0][0]
    }

    var dp = [[String]]()
    func shortestCommonSupersequence2(_ str1: String, _ str2: String) -> String {
        dp = Array(repeating: Array(repeating: "", count: str2.count), count: str1.count)
        return shortestCommonSupersequence2(0, 0, Array(str1), Array(str2))
    }

    func shortestCommonSupersequence2(_ index1: Int, _ index2: Int, _ chars1: [Character], _ chars2: [Character]) -> String {
        if index1 >= chars1.count && index2 >= chars2.count {
            return ""
        }

        if index1 >= chars1.count {
            return String(chars2[index2..<chars2.count])
        }

        if index2 >= chars2.count {
            return String(chars1[index1..<chars1.count])
        }

        if dp[index1][index2] != "" {
            return dp[index1][index2]
        }

        let char1 = chars1[index1]
        let char2 = chars2[index2]
        var result = ""
        if char1 == char2 {
            result = String(char1) + shortestCommonSupersequence2(index1 + 1, index2 + 1, chars1, chars2)
        } else {
            let commonSupersequence1 = String(char1) + shortestCommonSupersequence2(index1 + 1, index2, chars1, chars2)
            let commonSupersequence2 = String(char2) + shortestCommonSupersequence2(index1, index2 + 1, chars1, chars2)
            result = commonSupersequence1.count < commonSupersequence2.count ? commonSupersequence1 : commonSupersequence2
        }

        dp[index1][index2] = result
        return result
    }

}

Solution().shortestCommonSupersequence("abac", "cab")
Solution().shortestCommonSupersequence("aaaaaaaa", "aaaaaaaa")
Solution().shortestCommonSupersequence("dynamic", "programming")
