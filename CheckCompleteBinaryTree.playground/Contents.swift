import UIKit

/*
 Given the root of a binary tree, determine if it is a complete binary tree.

 In a complete binary tree, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

  

 Example 1:


 Input: root = [1,2,3,4,5,6]
 Output: true
 Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
 Example 2:


 Input: root = [1,2,3,4,5,null,7]
 Output: false
 Explanation: The node with value 7 isn't as far left as possible.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 100].
 1 <= Node.val <= 1000
 */
class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }

        // BFS
        var queue: [TreeNode?] = [root] //q=[1]
        var prevLevelLastNode: TreeNode? = TreeNode(0) //prevLevelLastNode=3
        while queue.count > 0 { //[4,5,6,nil]
            if queue.filter({ $0 != nil }).count == 0 { break }
            if prevLevelLastNode == nil { return false }

            var newQueue: [TreeNode?] = []
            var prev: TreeNode? = TreeNode(0)
            for node in queue {
                if node != nil && prev == nil {
                    return false
                }

                if let node = node {
                    if let left = node.left {
                        newQueue.append(left) //new=[nil,nil,nil,nil,nil,nil]
                    } else {
                        newQueue.append(nil)
                    }

                    if let right = node.right {
                        newQueue.append(right)
                    } else {
                        newQueue.append(nil) //new=[4,5,6,nil]
                    }
                }
                prev = node
            }

            prevLevelLastNode = queue[queue.count - 1]
            queue = newQueue
        }
        return true
    }

}
