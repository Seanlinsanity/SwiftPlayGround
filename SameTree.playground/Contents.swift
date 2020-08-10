import UIKit

/*
Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

Example 1:

Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

Output: true
Example 2:

Input:     1         1
          /           \
         2             2

        [1,2],     [1,null,2]

Output: false
Example 3:

Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

Output: false
 */

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//    isSameTreeTraverse(p, q)
    return isSameTreeResursion(p, q)
}

func isSameTreeResursion(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil { return true }  // if both are nil, then OK
    if p == nil || q == nil { return false } // if they're not equal, not OK
  
    // return if the value and its recursive tree elements are the same
    return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
}


func isSameTreeTraverse(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
     let pTreeValues = treeValues(treeNode: p)
     let qTreeValues = treeValues(treeNode: q)
     if (pTreeValues.count != qTreeValues.count) {
         return false
     } else if (pTreeValues.count == 0){
         return true
     } else {
         for i in 0...pTreeValues.count - 1 {
             if (pTreeValues[i] != qTreeValues[i]) {
                 return false
             }
         }
         return true
     }
}

func treeValues(treeNode: TreeNode?) -> [Int?] {
    if treeNode == nil {
        return [Int]()
    }
    var pTree = [TreeNode?]()
    pTree.append(treeNode!)
    var pTreeValues = [Int?]()
    while (pTree.count > 0) {
        let node = pTree[0]
        if (node != nil) {
            pTreeValues.append(node?.val)
            pTree.append(node?.left)
            pTree.append(node?.right)
        } else {
            pTreeValues.append(nil)
        }

        pTree.remove(at: 0)
    }
    return pTreeValues
}
