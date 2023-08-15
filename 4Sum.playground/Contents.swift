import UIKit

/*
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

  

 Example 1:

 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 Example 2:

 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]
  

 Constraints:

 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 */

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 { return [] }

        var result = [[Int]]()
        let sortedNums = nums.sorted()
        var prev = Int.min
        for index in 0..<sortedNums.count - 3 {
            let num = sortedNums[index]
            if num == prev { continue }

            // O(N^2)
            let threeSumResult = threeSum(sortedNums, index + 1, target - num)
            for threeSum in threeSumResult {
                result.append([num] + threeSum)
            }

            prev = num
        }
        return result
    }

    func threeSum(_ nums: [Int], _ start: Int, _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var prev = Int.min
        for index in start..<nums.count - 2 {
            let num = nums[index]
            if num == prev { continue }

            let diff = target - num
            var left = index + 1
            var right = nums.count - 1

            while left < right {
                if nums[left] + nums[right] < diff {
                    left += 1
                } else if nums[left] + nums[right] > diff {
                    right -= 1
                } else {
                    result.append([num, nums[left], nums[right]])
                    let leftNum = nums[left]
                    while left < right && nums[left] == leftNum {
                        left += 1
                    }
                    right -= 1
                }
            }

            prev = num
        }

        return result
    }
}

Solution().fourSum([1,0,-1,0,-2,2], 0)
Solution().fourSum([2,2,2,2,2], 8)
Solution().fourSum([4, 1, 2, -1, 1, -3], 1)
Solution().fourSum([2, 0, -1, 1, -2, 2], 2)
