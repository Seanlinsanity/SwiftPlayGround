import UIKit

/*
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

 Merge all the linked-lists into one sorted linked-list and return it.

  

 Example 1:

 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 Example 2:

 Input: lists = []
 Output: []
 Example 3:

 Input: lists = [[]]
 Output: []
  

 Constraints:

 k == lists.length
 0 <= k <= 104
 0 <= lists[i].length <= 500
 -104 <= lists[i][j] <= 104
 lists[i] is sorted in ascending order.
 The sum of lists[i].length will not exceed 104.
 */

class ListNode {
    let val: Int
    var next: ListNode?

    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 { return nil }
        if lists.count == 1 { return lists[0] }

        let mid = lists.count / 2
        let left = Array(lists[0..<mid])
        let right = Array(lists[mid..<lists.count])

        return merge(mergeKLists(left), mergeKLists(right))
    }

    func merge(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var node1 = list1
        var node2 = list2
        var merge: ListNode?
        var current: ListNode?
        while node1 != nil && node2 != nil {
            guard let val1 = node1?.val, let val2 = node2?.val else { return nil }
            if val1 <= val2 {
                if merge == nil {
                    merge = node1
                    current = merge
                } else {
                    current?.next = node1
                    current = current?.next
                }
                node1 = node1?.next
            } else {
                if merge == nil {
                    merge = node2
                    current = merge
                } else {
                    current?.next = node2
                    current = current?.next
                }
                node2 = node2?.next
            }
        }

        if node1 != nil {
            if merge == nil { return node1 }

            current?.next = node1
        }

        if node2 != nil {
            if merge == nil { return node2 }

            current?.next = node2
        }

        return merge
    }

}
