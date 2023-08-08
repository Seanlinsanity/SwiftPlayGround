import UIKit

/*
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

 If target is not found in the array, return [-1, -1].

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:

 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:

 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 Example 3:

 Input: nums = [], target = 0
 Output: [-1,-1]
  

 Constraints:

 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 nums is a non-decreasing array.
 -109 <= target <= 109
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // edge case
        if nums.count == 0 { return [-1, -1] }

        var smallestIndex = -1
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            let num = nums[mid]
            if num > target {
                right = mid - 1
            } else if num < target {
                left = mid + 1
            } else {
                if mid > 0 && nums[mid - 1] == target {
                    right = mid - 1
                } else {
                    smallestIndex = mid
                    break
                }
            }
        }

        if smallestIndex == -1 { return [-1, -1] }

        var largestIndex = smallestIndex
        left = smallestIndex
        right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            let num = nums[mid]
            if num > target {
                right = mid - 1
            } else {
                if mid < nums.count - 1 && nums[mid + 1] == target {
                    left = mid + 1
                } else {
                    largestIndex = mid
                    break
                }
            }
        }

        return [smallestIndex, largestIndex]
    }
}

Solution().searchRange([5,7,7,8,8,10], 8)
Solution().searchRange([5,7,7,8,8,10], 6)
Solution().searchRange([], 0)

