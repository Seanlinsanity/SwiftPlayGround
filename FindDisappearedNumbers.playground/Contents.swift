import UIKit

/*
 Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

  

 Example 1:

 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 Example 2:

 Input: nums = [1,1]
 Output: [2]
  

 Constraints:

 n == nums.length
 1 <= n <= 105
 1 <= nums[i] <= n

 Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 */
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var copyNums = nums
        for index in 0..<copyNums.count {
            if index == copyNums[index] - 1 {
                continue
            }

            while copyNums[index] != index + 1 {
                let num = copyNums[index]
                let position = num - 1
                if copyNums[position] == num {
                    break
                }
                copyNums[index] = copyNums[position]
                copyNums[position] = num
            }
        }

        var result = [Int]()
        for (index, num) in copyNums.enumerated() {
            if index != num - 1 {
                result.append(index + 1)
            }
        }

        return result
    }
}

Solution().findDisappearedNumbers([4,3,2,7,8,2,3,1])
Solution().findDisappearedNumbers([1,1])
Solution().findDisappearedNumbers([2, 3, 1, 8, 2, 3, 5, 1])
Solution().findDisappearedNumbers([2, 4, 1, 2])
Solution().findDisappearedNumbers([2, 3, 2, 1])

