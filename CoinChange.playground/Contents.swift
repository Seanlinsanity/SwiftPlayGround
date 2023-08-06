import UIKit

/*
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

 Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 You may assume that you have an infinite number of each kind of coin.

  

 Example 1:

 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:

 Input: coins = [2], amount = 3
 Output: -1
 Example 3:

 Input: coins = [1], amount = 0
 Output: 0
 */

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var amountResult = Array(repeating: -1, count: amount + 1)
        for idx in 0...amount {
            let amount = idx
            if amount == 0 {
                amountResult[amount] = 0
                continue
            }

            var result = Int.max
            for coin in coins where amount >= coin {
                let prevResult = amountResult[amount - coin]
                if prevResult >= 0 {
                    result = min(result, prevResult + 1)
                }
            }

            var minResult = -1
            if result != Int.max {
                minResult = result
            }
            amountResult[amount] = minResult
        }

        return amountResult[amount]
    }
    
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: Int.max, count: amount + 1)
        dp[0] = 0
        for num in 0...amount {
            for coin in coins {
                if num - coin >= 0 {
                    dp[num] = min(dp[num], dp[num - coin] != Int.max ? 1 + dp[num - coin] : Int.max)
                }
            }
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
    }


}

Solution().coinChange([1,2,5], 11)
Solution().coinChange([2], 3)
Solution().coinChange([1], 0)

Solution().coinChange2([1,2,5], 11)
Solution().coinChange2([2], 3)
Solution().coinChange2([1], 0)
