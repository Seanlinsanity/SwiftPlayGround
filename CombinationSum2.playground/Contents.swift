import UIKit

/*
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

 Each number in candidates may only be used once in the combination.

 Note: The solution set must not contain duplicate combinations.

  

 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8
 Output:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5
 Output:
 [
 [1,2,2],
 [5]
 ]
  

 Constraints:

 1 <= candidates.length <= 100
 1 <= candidates[i] <= 50
 1 <= target <= 30
 */

class Solution {
    var result = [[Int]]()
    var current = [Int]()
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sortedCandidates = candidates.sorted()
        combinationSum2(0, sortedCandidates, 0, target)
        return result
    }

    func combinationSum2(_ index: Int, _ candidates: [Int], _ sum: Int, _ target: Int) {
        if sum == target {
            result.append(current)
            return
        }

        if sum > target || index >= candidates.count {
            return
        }

        let num = candidates[index]
        current.append(num)
        combinationSum2(index + 1, candidates, sum + num, target)
        current.removeLast()

        var nextIndex = index + 1
        while nextIndex < candidates.count && candidates[nextIndex] == num {
            nextIndex += 1
        }
        combinationSum2(nextIndex, candidates, sum, target)
    }
}

Solution().combinationSum2([10,1,2,7,6,1,5], 8)
Solution().combinationSum2([2,5,2,1,2], 5)
