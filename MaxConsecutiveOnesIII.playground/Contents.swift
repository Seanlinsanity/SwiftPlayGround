import UIKit

/*
 Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

  

 Example 1:

 Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
 Output: 6
 Explanation: [1,1,1,0,0,1,1,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
 Example 2:

 Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
 Output: 10
 Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
  

 Constraints:

 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 0 <= k <= nums.length
 */

class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        // edge case
        if k == nums.count { return k }

        var result = 0  // res=6
        var left = 0 // l=4
        var right = 0 // r=10
        var zeroCount = 0 // zero=2
        while right < nums.count {
            if nums[right] == 0 {
                zeroCount += 1
            }

            while left <= right && zeroCount > k {
                let leftNum = nums[left]
                if leftNum == 0 {
                    zeroCount -= 1
                }
                left += 1
            }

            result = max(result, right - left + 1)
            right += 1
        }

        return result
    }
}

Solution().longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2)
Solution().longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3)
