import UIKit
/*
Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

Note: Do not modify the linked list.

Follow up:
Can you solve it without using extra space?
*/

class Node: Equatable{
    static func == (lhs: Node, rhs: Node) -> Bool {
        if lhs === rhs {
            return true
        }else{
            return false
        }
        
    }
    
    let val: Int
    var next: Node?
    
    init(value: Int) {
        self.val = value
    }
}

let headNode = Node(value: 1)
let cycleBeginNode = Node(value: 30)
let node6 = Node(value: 6)
let node8 = Node(value: 8)
let node10 = Node(value: 10)

headNode.next = cycleBeginNode
cycleBeginNode.next = node6
node6.next = node8
node8.next = node10
node10.next = cycleBeginNode

func findCycleBeginNode(head: Node?) -> Node? {
    
    if head == nil || head?.next == nil || head?.next?.next == nil{ return nil }

    var fastNode = head?.next?.next
    var slowNode = head?.next

    while (fastNode != slowNode) {
        if fastNode?.next == nil || fastNode?.next?.next == nil {
            return nil
        }
        fastNode = fastNode?.next?.next
        slowNode = slowNode?.next
    }

    fastNode = head
    while (fastNode != slowNode) {
        fastNode = fastNode?.next
        slowNode = slowNode?.next
    }

    return slowNode
    
}

func findCycleBeginNode(with head: Node?) -> Node? {

    if head == nil || head?.next == nil {
        return nil
    }
    
    var currentNode = head
    var nodeDict = [Int: Int]()
    while (currentNode != nil) {
        if nodeDict[currentNode!.val] == 0 {
            return currentNode
        }
        nodeDict[currentNode!.val] = 0
        currentNode = currentNode?.next
    }
    
    return nil
}
print(findCycleBeginNode(head: headNode)?.val ?? "nil")
print(findCycleBeginNode(with: headNode)?.val ?? "nil")


/*
Javascript
function(head) {
    
    if (!head || !head.next || !head.next.next){
        return null
    }
    
    let slowNode = head.next
    let fastNode = head.next.next
    
    while(fastNode != slowNode){
        if (!fastNode.next || !fastNode.next.next) {
            return null
        }
        fastNode = fastNode.next.next
        slowNode = slowNode.next
    }
    
    fastNode = head
    while(fastNode != slowNode){
        slowNode = slowNode.next
        fastNode = fastNode.next
    }
    
    return slowNode
    
    
}
*/
