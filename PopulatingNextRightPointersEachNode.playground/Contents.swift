import UIKit

/*
 
 Populating Next Right Pointers in Each Node
 
 You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.

  

 Example 1:


 Input: root = [1,2,3,4,5,6,7]
 Output: [1,#,2,3,#,4,5,6,7,#]
 Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
 Example 2:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 212 - 1].
 -1000 <= Node.val <= 1000
  

 Follow-up:

 You may only use constant extra space.
 The recursive approach is fine. You may assume implicit stack space does not count as extra space for this problem.
 
 
 
 
 
 -------------------------------------------------------------------------------------------------------------------------------
 
 
 
 
 Populating Next Right Pointers in Each Node II

 Given a binary tree

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.

  

 Example 1:


 Input: root = [1,2,3,4,5,null,7]
 Output: [1,#,2,3,#,4,5,7,#]
 Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
 Example 2:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 6000].
 -100 <= Node.val <= 100
  

 Follow-up:

 You may only use constant extra space.
 The recursive approach is fine. You may assume implicit stack space does not count as extra space for this problem.
 */


class Solution {
    class Node {
        var val: Int
        var left: Node?
        var right: Node?
        var next: Node?

        init(_ val: Int, _ left: Node? = nil, _ right: Node? = nil, _ next: Node? = nil) {
            self.val = val
            self.left = left
            self.right = right
            self.next = next
        }

    }

    func connectII(_ root: Node?) -> Node? {
        // edge case
        guard let root = root else { return nil }

        var next: Node? = root
        while next != nil {
            var current = next
            while current != nil {
                if current?.right != nil {
                    current?.left?.next = current?.right
                    current?.right?.next = findNearestNode(current?.next)
                } else if current?.left != nil {
                    current?.left?.next = findNearestNode(current?.next)
                }
                current = current?.next
            }

            current = next
            next = nil
            while current != nil {
                if current?.left != nil {
                    next = current?.left
                    break
                }

                if current?.right != nil {
                    next = current?.right
                    break
                }
                current = current?.next
            }

        }

        return root
    }

    private func findNearestNode(_ node: Node?) -> Node? {
        var current = node
        while current != nil {
            if current?.left != nil {
                return current?.left
            }

            if current?.right != nil {
                return current?.right
            }

            current = current?.next
        }
        return nil
    }

    func connect(_ root: Node?) -> Node? {
        // edge case
        guard let root = root else { return nil }

        var next: Node? = root
        while next != nil {
            var current = next
            while current != nil {
                current?.left?.next = current?.right
                if let currentNext = current?.next {
                    current?.right?.next = currentNext.left
                }
                current = current?.next
            }
            next = next?.left
        }

        return root
    }
}
