import UIKit

/*
 Given a number sequence, find the minimum number of elements that should be deleted to make the remaining sequence sorted.

 Example 1:

 Input: {4,2,3,6,10,1,12}
 Output: 2
 Explanation: We need to delete {4,1} to make the remaing sequence sorted {2,3,6,10,12}.
 Example 2:

 Input: {-4,10,3,7,15}
 Output: 1
 Explanation: We need to delete {10} to make the remaing sequence sorted {-4,3,7,15}.
 Example 3:

 Input: {3,2,1,0}
 Output: 3
 Explanation: Since the elements are in reverse order, we have to delete all except one to get a
 sorted sequence. Sorted sequences are {3}, {2}, {1}, and {0}

 */

class Solution {
    func minimumNumberElementsDeletedToSorted(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        let longestCommonSequnce = longestCommonSequence(nums, sortedNums)
        return nums.count - longestCommonSequnce
    }

    func longestCommonSequence(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: nums1.count + 1), count: nums2.count + 1)
        for row in stride(from: nums2.count - 1, through: 0, by: -1) {
            for column in stride(from: nums1.count - 1, through: 0, by: -1) {
                let num1 = nums1[column]
                let num2 = nums2[row]
                if num1 == num2 {
                    dp[row][column] = 1 + dp[row + 1][column + 1]
                } else {
                    dp[row][column] = max(dp[row + 1][column], dp[row][column + 1])
                }
            }
        }

        return dp[0][0]
    }

}

Solution().minimumNumberElementsDeletedToSorted([4,2,3,6,10,1,12])
Solution().minimumNumberElementsDeletedToSorted([-4,10,3,7,15])
Solution().minimumNumberElementsDeletedToSorted([3,2,1,0])
