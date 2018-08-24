//: Playground - noun: a place where people can play

import UIKit

class Node {
    
    let value: Int
    var leftNode: Node?
    var rightNode: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

let node0 = Node(0)
let node1 = Node(1)
let node0_1 = Node(0)
let node0_2 = Node(0)
let node0_3 = Node(0)
let node0_4 = Node(0)
let node1_1 = Node(1)
let node1_2 = Node(1)
let node1_3 = Node(1)

node0.leftNode = node1
node0.rightNode = node0_1
node0_1.leftNode = node1_1
node0_1.rightNode = node0_2
node1_1.leftNode = node1_2
node1_1.rightNode = node1_3
node0_2.leftNode = node0_3
node0_2.rightNode = node0_4

//        0
//   1        0
//        1      0
//      1   1  0   0



func countUniversalTree(root: Node?) -> Int {
    var count = 0
    
    if root?.leftNode != nil && root?.rightNode != nil {
        if root?.value == root?.leftNode?.value && root?.value == root?.rightNode?.value {
            count += 1
        }
        count = count + countUniversalTree(root: root?.leftNode) + countUniversalTree(root: root?.rightNode)
    }else if root?.leftNode == nil && root?.rightNode == nil {
        count += 1
    }else if root?.leftNode != nil {
        count = count + countUniversalTree(root: root?.leftNode)
    }else if root?.rightNode != nil {
        count = count + countUniversalTree(root: root?.rightNode)
    }
    print(count)
    return count
}

countUniversalTree(root: node0)









