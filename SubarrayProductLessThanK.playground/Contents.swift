import UIKit
/*
Your are given an array of positive integers nums.

Count and print the number of (contiguous) subarrays where the product of all the elements in the subarray is less than k.

Example 1:
Input: nums = [10, 5, 2, 6], k = 100
Output: 8
Explanation: The 8 subarrays that have product less than 100 are: [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6].
Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.
Note:

0 < nums.length <= 50000.
0 < nums[i] < 1000.
0 <= k < 10^6.
*/

func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    var prefixNums = [Double]()
    var sum: Double = 0
    
    for i in 0...nums.count - 1 {
        prefixNums.append(sum)
        sum += log(Double(nums[i]))
    }
    prefixNums.append(sum)
    
    // print(prefixNums)
    var count = 0
    for i in 0...prefixNums.count - 1{
        var low = i + 1
        var high = prefixNums.count
        while(low < high) {
            let min = (low + high) / 2
            if prefixNums[min] < prefixNums[i] + log(Double(k)) - 10e-9 {
                low = min + 1
            }else{
                high = min
            }
            print(low, high)
        }
        count += (low - i - 1)
    }
    return count
    
}

numSubarrayProductLessThanK([10, 5, 2, 6], 100)
