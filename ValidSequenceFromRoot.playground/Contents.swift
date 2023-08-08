import UIKit

/*
 Given a binary tree where each path going from the root to any leaf form a valid sequence, check if a given string is a valid sequence in such binary tree.

 We get the given string from the concatenation of an array of integers arr and the concatenation of all values of the nodes along a path results in a sequence in the given binary tree.


 */

class TreeNode {
    let val: Int
    let left: TreeNode?
    let right: TreeNode?
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}


func validSequenceFromRoot(_ root: TreeNode?, _ sequence: [Int]) -> Bool {
    guard let root = root else { return sequence.count == 0 }
    if sequence.count == 0 { return true }
    return validSequenceFromRoot(0, root, sequence)
}

func validSequenceFromRoot(_ index: Int, _ node: TreeNode?, _ sequence: [Int]) -> Bool {
    guard let node = node else { return false }

    if node.val != sequence[index] { return false }

    if index == sequence.count - 1 {
        return node.left == nil && node.right == nil
    } else {
        return validSequenceFromRoot(index + 1, node.left, sequence) ||
            validSequenceFromRoot(index + 1, node.right, sequence)
    }
}
