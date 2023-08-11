import UIKit

/*
 Given a number sequence, find the increasing subsequence with the highest sum. Write a method that returns the highest sum.

 Example 1:

 Input: {4,1,2,6,10,1,12}
 Output: 32
 Explanation: The increaseing sequence is {4,6,10,12}.
 Please note the difference, as the LIS is {1,2,6,10,12} which has a sum of '31'.
 Example 2:

 Input: {-4,10,3,7,15}
 Output: 25
 Explanation: The increaseing sequences are {10, 15} and {3,7,15}.
 */

class Solution {
    func maxSumIncreasingSubsequence(_ nums: [Int]) -> Int {
        // edge case
        if nums.count == 1 { return nums[0] }

        var result = Int.min
        var dp = Array(repeating: Int.min, count: nums.count)
        dp[nums.count - 1] = nums[nums.count - 1]
        for index in stride(from: nums.count - 2, through: 0, by: -1) {
            let num = nums[index]
            var sum = num
            for next in index + 1..<nums.count {
                if nums[next] > num {
                    sum = max(sum, num + dp[next])
                }
            }
            dp[index] = sum
            result = max(result, sum)
        }

        return result
    }

}

Solution().maxSumIncreasingSubsequence([4,1,2,6,10,1,12])
Solution().maxSumIncreasingSubsequence([-4,10,3,7,15])
