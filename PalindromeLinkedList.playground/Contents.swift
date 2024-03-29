//: A MapKit based Playground

import Foundation

/*
 Given a singly linked list, determine if it is a palindrome.
 
 Example 1:
 
 Input: 1->2
 Output: false
 Example 2:
 
 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 
*/

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func isPalindrome(_ head: ListNode?) -> Bool {
    if head == nil { return true }
    
    var arr = [Int]()
    var currentNode = head
    
    while(currentNode != nil){
        arr.append(currentNode!.val)
        currentNode = currentNode!.next
    }
    
    for i in 0...(arr.count/2){
        if arr[i] != arr[arr.count - 1 - i]{
            return false
        }
    }
    
    return true
}


func isPalindromeOptimal(_ head: ListNode?) -> Bool {
    guard let head = head else { return false }

    var slow: ListNode? = head
    var fast: ListNode? = head
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }

    var prev: ListNode?
    var current: ListNode? = slow
    while current != nil {
        let temp = current?.next
        current?.next = prev
        prev = current
        current = temp
    }

    var rightNodeList: ListNode? = prev
    var leftNodeList: ListNode? = head

    while rightNodeList != nil {
        if leftNodeList?.val != rightNodeList?.val {
            return false
        }

        rightNodeList = rightNodeList?.next
        leftNodeList = leftNodeList?.next
    }

    return true
}


