import UIKit

/*
 Given an integer array nums, return the number of longest increasing subsequences.

 Notice that the sequence has to be strictly increasing.

  

 Example 1:

 Input: nums = [1,3,5,4,7]
 Output: 2
 Explanation: The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].
 Example 2:

 Input: nums = [2,2,2,2,2]
 Output: 5
 Explanation: The length of the longest increasing subsequence is 1, and there are 5 increasing subsequences of length 1, so output 5.
  

 Constraints:

 1 <= nums.length <= 2000
 -106 <= nums[i] <= 106
 */
class Solution {
    struct Node {
        let maxLength: Int
        let count: Int
        init(_ maxLength: Int, _ count: Int) {
            self.maxLength = maxLength
            self.count = count
        }
    }

    // [1,3,5,4,7]
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        // edge case
        if nums.count == 1 { return 1 }

        // [{0,0},{0,0},{2,1},{2,1},{1,1}]
        var dp = Array(repeating: Node(0, 0), count: nums.count)
        dp[nums.count - 1] = Node(1, 1)
        var maxLength = 1
        var maxCount = 1
        for index in stride(from: nums.count - 2, through: 0, by: -1) {
            let num = nums[index]
            var length = 1
            var count = 1
            for next in index + 1..<nums.count {
                if nums[next] > num {
                    let nextNode = dp[next]
                    if 1 + nextNode.maxLength > length {
                        length = 1 + nextNode.maxLength
                        count = nextNode.count
                    } else if 1 + nextNode.maxLength == length {
                        count += nextNode.count
                    }
                }
            }

            dp[index] = Node(length, count)

            if length > maxLength {
                maxLength = length
                maxCount = count
            } else if length == maxLength {
                maxCount += count
            }

        }

        return maxCount
    }
}

Solution().findNumberOfLIS([1,3,5,4,7])
Solution().findNumberOfLIS([2,2,2,2,2])
