import UIKit

/*
 Given an array arr of unsorted numbers and a target sum, count all triplets in it such that arr[i] + arr[j] + arr[k] < target where i, j, and k are three different indices. Write a function to return the count of such triplets.

 Example 1:

 Input: [-1, 0, 2, 3], target=3
 Output: 2
 Explanation: There are two triplets whose sum is less than the target: [-1, 0, 3], [-1, 0, 2]
 Example 2:

 Input: [-1, 4, 2, 1, 3], target=5
 Output: 4
 Explanation: There are four triplets whose sum is less than the target:
 [-1, 1, 4], [-1, 1, 3], [-1, 1, 2], [-1, 2, 3]
 */

class Solution {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        // edge case
        guard nums.count >= 3 else { return 0 }

        var result = 0
        let sortedNums = nums.sorted()
        for index in 0...sortedNums.count - 3 {
            let num = sortedNums[index]
            let newTarget = target - num
            var left = index + 1
            var right = sortedNums.count - 1
            while left < right {
                let sum = sortedNums[left] + sortedNums[right]
                if sum < newTarget {
                    result += (right - left)
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return result
    }
}

Solution().threeSumSmaller([-1, 0, 2, 3], 3)
Solution().threeSumSmaller([-1, 4, 2, 1, 3], 5)
