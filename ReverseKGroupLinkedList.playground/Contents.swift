import UIKit
/*
 Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

 You may not alter the values in the list's nodes, only nodes themselves may be changed.

  

 Example 1:


 Input: head = [1,2,3,4,5], k = 2
 Output: [2,1,4,3,5]
 Example 2:


 Input: head = [1,2,3,4,5], k = 3
 Output: [3,2,1,4,5]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= k <= n <= 5000
 0 <= Node.val <= 1000
 */
class ListNode {
    let val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

/*
 
 dummy -> 1 -> 2 -> 3 -> 4 -> 5
 dummy    2 -> 1 -> null    3 -> 4 -> 5
    |          ^
    |__________|
 
 dummy    2 -> 1 -> 3 -> 4 -> 5
    |          ^
    |__________|

 dummy -> 2 -> 1 -> 3 -> 4 -> 5
 
 dummy -> 2 -> 1    4 -> 3 -> 5
               |         ^
               |_________|
 
 dummy -> 2 -> 1 -> 4 -> 3 -> 5
 */


class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }
        if k == 1 { return head }

        let dummy = ListNode(0, head)
        var prevGroup: ListNode? = dummy
        while true {
            let kthNode = getKthNode(prevGroup, k)
            if kthNode == nil { break }

            var groupNext = kthNode?.next
            var current: ListNode? = prevGroup?.next
            var prev: ListNode? = groupNext
            while current !== groupNext {
                let temp = current?.next
                current?.next = prev
                prev = current
                current = temp
            }

            let temp = prevGroup?.next
            prevGroup?.next = prev
            prevGroup = temp
        }

        return dummy.next
    }

    func getKthNode(_ node: ListNode?, _ k: Int) -> ListNode? {
        var current = node
        var count = 0
        while current != nil {
            if count == k { return current }
            current = current?.next
            count += 1
        }

        return nil
    }

}
