import UIKit
/*
 Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.

  

 Example 1:

 Input: nums = [10,5,2,6], k = 100
 Output: 8
 Explanation: The 8 subarrays that have product less than 100 are:
 [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
 Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.
 Example 2:

 Input: nums = [1,2,3], k = 0
 Output: 0
  

 Constraints:

 1 <= nums.length <= 3 * 104
 1 <= nums[i] <= 1000
 0 <= k <= 106
*/

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        // edge case
        if nums.count == 1 { return nums[0] < k ? 1 : 0 }

        var result = 0, left = 0, right = 0, current = 1

        while right < nums.count {
            current *= nums[right]

            while current >= k && left <= right {
                current /= nums[left]
                left += 1
            }

            result += (right - left + 1)
            right += 1
        }

        return result
    }
    
    func numSubarrayProductLessThanK2(_ nums: [Int], _ k: Int) -> Int {
        // edge case
        if nums.count == 1 { return nums[0] < k ? 1 : 0 }

        var result = 0, left = 0, right = 0, current = 1

        while left < nums.count { // l=3,r=3 //l=0,r=0
            current *= nums[right] // current=1
            while current < k && right < nums.count {
                if right == nums.count - 1 {
                    break
                }

                right += 1 // r=3
                current *= nums[right] // 60
            }

            if current < k {
                result += (right - left + 1)  // result=7+1
            } else {
                result += (right - left) // result = 0
            }

            if left == right {
                right += 1
            } else {
                current /= nums[right] // 0
            }
            current /= nums[left]
            left += 1
        }

        return result
    }
}

Solution().numSubarrayProductLessThanK([10, 5, 2, 6], 100)
Solution().numSubarrayProductLessThanK([1, 2, 3], 0)

Solution().numSubarrayProductLessThanK2([10, 5, 2, 6], 100)
Solution().numSubarrayProductLessThanK2([1, 2, 3], 0)
