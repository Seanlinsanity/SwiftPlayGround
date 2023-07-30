import UIKit

/*
 Given an integer array nums and an integer k, return the kth largest element in the array.

 Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Can you solve it without sorting?

  

 Example 1:

 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 Example 2:

 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
  

 Constraints:

 1 <= k <= nums.length <= 105
 -104 <= nums[i] <= 104
 */

class Solution {
    //[3,2,1,5,6,4], k=2
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.count == 1 {
            return nums[0]
        }

        let randomIndex = Int.random(in: 0..<nums.count)
        let pivot = nums[randomIndex] // 5

        var left = nums.filter({$0 < pivot}) //[3,2,4]
        var right = nums.filter({$0 > pivot}) //[6]
        var equal = nums.filter({$0 == pivot}) //[5]

        if k <= right.count {
            return findKthLargest(right, k)
        }

        if k > right.count + equal.count {
            return findKthLargest(left, k - right.count - equal.count)
        }

        return pivot
    }
}

Solution().findKthLargest([3,2,1,5,6,4], 2)
Solution().findKthLargest([3,2,3,1,2,4,5,5,6], 4)
