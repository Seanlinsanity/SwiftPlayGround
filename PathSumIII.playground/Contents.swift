import UIKit

/*
 Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.

 The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

  

 Example 1:


 Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
 Output: 3
 Explanation: The paths that sum to 8 are shown.
 Example 2:

 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: 3
  

 Constraints:

 The number of nodes in the tree is in the range [0, 1000].
 -109 <= Node.val <= 109
 -1000 <= targetSum <= 1000
 */

class TreeNode {
    let val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    var result = 0
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        guard let root = root else { return 0 }
        dfs(root, targetSum)
        return result
    }

    @discardableResult func dfs(_ node: TreeNode?, _ targetSum: Int) -> [Int] {
        guard let node = node else { return [] }

        if node.left == nil && node.right == nil {
            if node.val == targetSum {
                result += 1
            }
            return [node.val]
        }

        let nums = dfs(node.left, targetSum) + dfs(node.right, targetSum)
        if node.val == targetSum {
            result += 1
        }
        var newNums = [node.val]
        for num in nums {
            let sum = node.val + num
            newNums.append(sum)
            if sum == targetSum {
                result += 1
            }
        }
        return newNums
    }

    func pathSum2(_ root: TreeNode?, _ targetSum: Int) -> Int {
        guard let root = root else { return 0 }
        var prefixSumDict = [Int: Int]()
        prefixSumDict[0] = 1
        dfs2(root, 0, prefixSumDict, targetSum)
        return result
    }

    func dfs2(_ node: TreeNode?, _ sum: Int, _ prefixSumDict: [Int: Int], _ targetSum: Int) {
        guard let node = node else { return }

        let currentSum = sum + node.val
        let diff = currentSum - targetSum
        if let count = prefixSumDict[diff] {
            result += count
        }

        var newPrefixSumDict = prefixSumDict
        newPrefixSumDict[currentSum] = newPrefixSumDict[currentSum, default: 0] + 1
        dfs2(node.left, currentSum, newPrefixSumDict, targetSum)
        dfs2(node.right, currentSum, newPrefixSumDict, targetSum)
    }

}

