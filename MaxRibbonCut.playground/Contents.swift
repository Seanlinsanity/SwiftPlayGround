import UIKit

/*
 We are given a ribbon of length ‘n’ and a set of possible ribbon lengths. We need to cut the ribbon into the maximum number of pieces that comply with the above-mentioned possible lengths. Write a method that will return the count of pieces.

 Example 1:

 n: 5
 Ribbon Lengths: {2,3,5}
 Output: 2
 Explanation: Ribbon pieces will be {2,3}.
 Example 2:

 n: 7
 Ribbon Lengths: {2,3}
 Output: 3
 Explanation: Ribbon pieces will be {2,2,3}.
 Example 3:

 n: 13
 Ribbon Lengths: {3,5,7}
 Output: 3
 Explanation: Ribbon pieces will be {3,3,7}.
 */

class Solution {
    func maxRibbonCutBottomUp(_ n: Int, _ lengths: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: lengths.count + 1)
        for row in 0...lengths.count {
            dp[row][n] = 1
        }

        for row in stride(from: lengths.count - 1, through: 0, by: -1) {
            for column in stride(from: n - 1, through: 0, by: -1) {
                let cut = lengths[row]
                let ribbon = n - column
                var count = dp[row + 1][column]
                if ribbon > cut {
                    let diff = ribbon - cut
                    if dp[row][n - diff] > 0 {
                        count = max(count, 1 + dp[row][n - diff])
                    }
                } else if ribbon == cut {
                    count = max(count, 1)
                }
                dp[row][column] = count
            }
        }
        return dp[0][0]
    }

    func maxRibbonCut2(_ n: Int, _ lengths: [Int]) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        for num in 1...n {
            var count = 0
            for length in lengths {
                if num > length && dp[num - length] > 0 {
                    count  =  max(count, 1 + dp[num - length])
                }  else if num == length {
                    count = max(count, 1)
                }
            }
            dp[num] = count
        }
        return dp[n]
    }

    var cache = [Int]()
    func maxRibbonCut(_ ribbon: Int, _ lengths: [Int]) -> Int {
        cache = Array(repeating: -1, count: ribbon + 1)
        return maxRibbonCutRecursion(ribbon, lengths)
    }

    func maxRibbonCutRecursion(_ ribbon: Int, _ lengths: [Int]) -> Int {
        if ribbon == 0 { return 1 }
        if cache[ribbon] > -1 { return cache[ribbon] }
        var count = 0
        for length in lengths {
            if ribbon >= length {
                let maxCut = maxRibbonCutRecursion(ribbon - length, lengths)
                if maxCut > 0 {
                    count = max(count, ribbon > length ? 1 + maxCut : maxCut)
                }
            }
        }
        cache[ribbon] = count
        return count
    }
}

Solution().maxRibbonCutBottomUp(5, [2,3,5])
Solution().maxRibbonCutBottomUp(7, [2,3])
Solution().maxRibbonCutBottomUp(13, [3,5,7])

Solution().maxRibbonCut2(5, [2,3,5])
Solution().maxRibbonCut2(7, [2,3])
Solution().maxRibbonCut2(13, [3,5,7])

Solution().maxRibbonCut(5, [2,3,5])
Solution().maxRibbonCut(7, [2,3])
Solution().maxRibbonCut(13, [3,5,7])
