import UIKit

/*
 Given the root of a binary tree, return all duplicate subtrees.

 For each kind of duplicate subtrees, you only need to return the root node of any one of them.

 Two trees are duplicate if they have the same structure with the same node values.

  

 Example 1:


 Input: root = [1,2,3,4,null,2,4,null,null,4]
 Output: [[2,4],[4]]
 Example 2:


 Input: root = [2,1,1]
 Output: [[1]]
 Example 3:


 Input: root = [2,2,2,3,null,3,null]
 Output: [[2,3],[3]]
  

 Constraints:

 The number of the nodes in the tree will be in the range [1, 5000]
 -200 <= Node.val <= 200
 */
class TreeNode {
    let val: Int
    let left: TreeNode?
    let right: TreeNode?
    
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution {
    var result = [TreeNode]()
    var subtreeDict = [String: Int]()
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        guard let root = root else { return [] }
        postOrderTraversal(root)
        return result
    }
    
    func postOrderTraversal(_ node: TreeNode?) -> String {
        guard let node = node else { return "n" }

        let leftSubtree = postOrderTraversal(node.left)
        let rightSubtree = postOrderTraversal(node.right)
        let treeStr = String(node.val) + "," + leftSubtree + "," + rightSubtree
        if let nodeCount = subtreeDict[treeStr] {
            if nodeCount == 1 {
                result.append(node)
            }
            subtreeDict[treeStr] = nodeCount + 1
        } else {
            subtreeDict[treeStr] = 1
        }

        return treeStr
    }

}
