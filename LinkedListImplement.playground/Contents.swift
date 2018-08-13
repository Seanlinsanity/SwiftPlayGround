//: Playground - noun: a place where people can play

import UIKit

class Node {
    let value: Int
    var next: Node?
    
    init(value: Int){
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func insertNode(value: Int){
        var currentNode = self.head
        while (currentNode?.next != nil) {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = Node(value: value)
        
    }
    
    func count() -> Int {
        
        var currentNode = self.head
        var count = 0
        
        while(currentNode != nil){
            currentNode = currentNode?.next
            count += 1
        }
        
        return count
    }
    
    func removeNode(index: Int) -> Node?{
        
        if index == 0 {
            self.head = self.head?.next
            return self.head
        }
        
        var currentNode = self.head
        var previousNode = self.head
        var count = 0
        
        while(currentNode?.next != nil) {
            previousNode = currentNode
            currentNode = currentNode?.next
            count += 1
            
            if count == index {
                previousNode?.next = currentNode?.next
                return currentNode
            }
            
        }
        
        return nil
        
    }
    
    func getNode(index: Int) -> Node? {
        
        if self.head == nil { return nil }
        
        var currentNode = self.head
        var indexCount = 0
        
        while(currentNode?.next != nil){
            currentNode = currentNode?.next
            indexCount += 1
            
            if indexCount == index {
                return currentNode
            }
        }
        
        return nil
        
    }
    
}


let headNode = Node(value: 1)
let linkedList = LinkedList(head: headNode)

//print(linkedList.head?.value ?? "no value")
linkedList.insertNode(value: 4)
linkedList.insertNode(value: 6)
linkedList.insertNode(value: 10)
linkedList.insertNode(value: 30)
linkedList.insertNode(value: 11)
linkedList.insertNode(value: 24)
//print(linkedList.head?.next?.value ?? "no value")
//print(linkedList.getNode(index: 6)?.value ?? "no value")
//print(linkedList.count())
print(linkedList.removeNode(index: 0)?.value)
print(linkedList.getNode(index: 2)?.value)


func findCenterNode(linkedList: LinkedList) -> Int? {
    
    if linkedList.head == nil { return nil }
    
    var fastNode = linkedList.head
    var slowNode = linkedList.head
    
    while (fastNode?.next?.next != nil) {
        fastNode = fastNode?.next?.next
        slowNode = slowNode?.next
    }
    
    return slowNode?.value
    
    //    return linkedList.getNode(index: linkedList.count() / 2)?.value ?? nil
    
    
}

//print(findCenterNode(linkedList: linkedList))






