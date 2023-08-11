import UIKit

/*
 Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

 We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

 You must solve this problem without using the library's sort function.

  

 Example 1:

 Input: nums = [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 Example 2:

 Input: nums = [2,0,1]
 Output: [0,1,2]
  

 Constraints:

 n == nums.length
 1 <= n <= 300
 nums[i] is either 0, 1, or 2.
  

 Follow up: Could you come up with a one-pass algorithm using only constant extra space?
 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        // edge case
        if nums.count == 1 { return }

        var currentIndex = 0 // cur=2
        var zeroIndex = 0 // zero=2
        var twoIndex = nums.count - 1 // two=4
        while currentIndex <= twoIndex {
            let num = nums[currentIndex] // 2
            if num == 0 {
                swap(&nums, zeroIndex, currentIndex)
                zeroIndex += 1
                currentIndex += 1
            } else if num == 2 {
                swap(&nums, twoIndex, currentIndex)
                twoIndex -= 1
            } else if num == 1 {
                currentIndex += 1
            }
        }

    }

    private func swap(_ nums: inout [Int], _ index1: Int, _ index2: Int) {
        let temp = nums[index1]
        nums[index1] = nums[index2]
        nums[index2] = temp
    }

}
var colors1 = [2,0,2,1,1,0]
Solution().sortColors(&colors1)
var colors2 = [2,0,1]
Solution().sortColors(&colors2)
