//: Playground - noun: a place where people can play

import UIKit

class Node{
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

// 1 -> 2 -> 3 -> nil

let threeNode = Node(value: 3, next: nil)
let twoNode = Node(value: 2, next: threeNode)
let oneNode = Node(value: 1, next: twoNode)

func printList(head: Node?){
    
    var currentNode = head
    while currentNode != nil {
        print(currentNode?.value ?? "nil")
        currentNode = currentNode?.next
    }
}

printList(head: oneNode)

//nil <- 1 <- 2 <- 3

func reverseList(head: Node?) -> Node?{
    
    var currentNode = head
    var next: Node?
    var prev: Node?
    
    while currentNode != nil {
        next = currentNode?.next
        currentNode?.next = prev
        
        print("Prev: \(prev?.value ?? -10), Current: \(currentNode?.value ?? -10), Next: \(next?.value ?? -10)")
        
        prev = currentNode
        currentNode = next
    }
    
    return prev
}

let myReversedList = reverseList(head: oneNode)
printList(head: myReversedList)
