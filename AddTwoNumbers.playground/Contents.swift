//: Playground - noun: a place where people can play

import UIKit

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.

//Example
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int, next: ListNode?) {
            self.val = val
            self.next = next
    }
}

let threeNode_342 = ListNode(val: 3, next: nil)
let fourNode_342 = ListNode(val: 4, next: threeNode_342)
let twoNode_342 = ListNode(val: 2, next: fourNode_342)
//let sevenNode_3427 = ListNode(val: 7, next: twoNode_342)

let listNode1 = twoNode_342

let fourNode_465 = ListNode(val: 4, next: nil)
let sixNode_465 = ListNode(val: 6, next: fourNode_465)
let five_465 = ListNode(val: 5, next: sixNode_465)

let listNode2 = five_465

func getListNumber(listNode: ListNode) -> Int{
    
    var digit = 1
    var value = 0
    var currentNode: ListNode? = listNode
    
    while currentNode != nil {
        value += currentNode!.val * digit
        digit = digit * 10
        currentNode = currentNode!.next
    }
    
    return value
    
}

getListNumber(listNode: twoNode_342)

func addTwoListNumbers(listNode1: ListNode, listNode2: ListNode) -> ListNode{
    
    let number = getListNumber(listNode: listNode1) + getListNumber(listNode: listNode2)

    var digit = 10
    var currentNode: ListNode?
    var rootNode: ListNode?
    var nextNode: ListNode?
    
    while(number / digit > 0){
        
        if currentNode == nil{
            currentNode = ListNode(val: number % digit, next: nil)
            rootNode = currentNode
        }else{
            nextNode = ListNode(val: (number % digit) / (digit / 10), next: nil)
            currentNode?.next = nextNode
            
//            print(currentNode?.val, nextNode?.val)
            
            currentNode = nextNode
        }
        
        digit = digit * 10
    }
    
    let lastNode = ListNode(val: (number % digit) / (digit / 10), next: nil)
    
    if currentNode == nil {
        currentNode = lastNode
        rootNode = currentNode
    }else{
        currentNode?.next = lastNode
    }
    
    getListNumber(listNode: rootNode!)
    
    return rootNode!
    
}

addTwoListNumbers(listNode1: listNode1, listNode2: listNode2)

func optimalAddTowListNumbers(listNode1: ListNode, listNode2: ListNode){
    
    let dummyHeadNode = ListNode(val: 0, next: nil)
    var currentNode = dummyHeadNode
    var carry = 0
    var p: ListNode? = listNode1
    var q: ListNode? = listNode2
    
    while (p != nil || q != nil) {
        let sum = (p?.val ?? 0) + (q?.val ?? 0) + carry
        let value = sum % 10
        carry = sum / 10
        currentNode.next = ListNode(val: value, next: nil)
        currentNode = currentNode.next!
        
        p = p?.next
        q = q?.next
    }
    
    if carry > 0 {
        currentNode.next = ListNode(val: carry, next: nil)
    }
    
    print(getListNumber(listNode: dummyHeadNode.next!))
    
}

optimalAddTowListNumbers(listNode1: listNode1, listNode2: listNode2)


//class number {
//    var value: Int
//    init(value: Int) {
//        self.value = value
//    }
//}
//var a = number(value: 8)
//var b = a
//
//print(a.value, b.value)
//b.value = 10
//print(a.value, b.value)


