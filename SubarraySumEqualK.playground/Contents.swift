import UIKit

/*
 Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.

 A subarray is a contiguous non-empty sequence of elements within an array.

  

 Example 1:

 Input: nums = [1,1,1], k = 2
 Output: 2
 Example 2:

 Input: nums = [1,2,3], k = 3
 Output: 2
  

 Constraints:

 1 <= nums.length <= 2 * 104
 -1000 <= nums[i] <= 1000

 */

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var prefixCountDict = [Int: Int]()
        prefixCountDict[0] = 1

        var prefixSum = 0
        for num in nums {
            let newPrefixSum = prefixSum + num
            let diff = newPrefixSum - k
            if let count = prefixCountDict[diff] {
                result += count
            }
            prefixCountDict[newPrefixSum] = prefixCountDict[newPrefixSum, default: 0] + 1
            prefixSum = newPrefixSum
        }

        return result
    }
}

Solution().subarraySum([1,1,1], 2)
Solution().subarraySum([1,2,3], 3)
