import UIKit

/*
 Given a set of positive numbers, find the total number of subsets whose sum is equal to a given number 'S'.

 Example 1:

 Input: {1, 1, 2, 3}, S=4
 Output: 3
 The given set has '3' subsets whose sum is '4': {1, 1, 2}, {1, 3}, {1, 3}
 Note that we have two similar sets {1, 3}, because we have two '1' in our input.
 Example 2:

 Input: {1, 2, 7, 1, 5}, S=9
 Output: 3
 The given set has '3' subsets whose sum is '9': {2, 7}, {1, 7, 1}, {1, 2, 1, 5}

 */

class Solution {
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: nums.count + 1)
        for row in 0...nums.count {
            dp[row][k] = 1
        }
        
        for row in stride(from: nums.count - 1, through: 0, by: -1) {
            for column in stride(from: k - 1, through: 0, by: -1) {
                let target = k - column
                let num = nums[row]
                var count = 0
                if target >= num {
                    let diff = target - num
                    count += dp[row + 1][k - diff]
                }
                count += dp[row + 1][column]
                dp[row][column] = count
            }
        }
        
        return dp[0][0]
    }
    
    var cache = [[Int]]()
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        cache = Array(repeating: Array(repeating: -1, count: k + 1), count: nums.count)
        return subarraySum(0, nums, k)
    }

    func subarraySum(_ index: Int, _ nums: [Int], _ target: Int) -> Int {
        if target == 0 { return 1 }
        if target < 0 || index >= nums.count { return 0 }

        if cache[index][target] != -1 {
            return cache[index][target]
        }

        let num = nums[index]
        var count = 0
        if target >= num {
            count += subarraySum(index + 1, nums, target - num)
        }
        count += subarraySum(index + 1, nums, target)
        cache[index][target] = count
        return count
    }

}

Solution().subarraySum([1,1,2,3], 4)
Solution().subarraySum([1,2,7,1,5], 9)
Solution().subarraySum([1,1,2,2,3], 3)

Solution().subarraySum2([1,1,2,3], 4)
Solution().subarraySum2([1,2,7,1,5], 9)
Solution().subarraySum2([1,1,2,2,3], 3)
