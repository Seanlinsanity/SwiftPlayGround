//: Playground - noun: a place where people can play

import UIKit

/*
Given a linked list, swap every two adjacent nodes and return its head.

Example:

Given 1->2->3->4, you should return the list as 2->1->4->3
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func swapPairs(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var node1 = head
    var node2 = head?.next
    
    while node1 != nil && node2 != nil {
        
        let tmpVal = (node1?.val)!
        node1?.val = (node2?.val)!
        node2?.val = tmpVal
        node1 = node2?.next
        node2 = node1?.next
    }
    
    return head
}

let node5 = ListNode(5)
let node4 = ListNode(4)
let node3 = ListNode(3)
let node2 = ListNode(2)
let node1 = ListNode(1)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

func printList(head: ListNode?) {
    
    var currentNode = head
    
    while currentNode != nil {
        print(currentNode!.val)
        currentNode = currentNode?.next
    }
}

printList(head: swapPairs(node1))
