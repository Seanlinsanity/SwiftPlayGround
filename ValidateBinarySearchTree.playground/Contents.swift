//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value: Int
    var right: Node?
    var left: Node?

    init(value: Int) {
        self.value = value
        self.right = nil
        self.left = nil
    }
    
}


//        7
//      /   \
//    5      10
//   / \    /  \
//  1   9  8    12
let rootNode7 = Node(value: 7)
let node5 = Node(value: 5)
let node1 = Node(value: 1)
let node9 = Node(value: 9)
let node10 = Node(value: 10)
let node8 = Node(value: 8)
let node12 = Node(value: 12)

rootNode7.left = node5
node5.left = node1
node5.right = node9
rootNode7.right = node10
node10.left = node8
node10.right = node12


func validate(node: Node, min: Int?, max: Int?) -> Bool {
    
    if max != nil && node.value > max! {
        return false
    }
    
    if min != nil && node.value < min! {
        return false
    }
    
    if node.left != nil && !validate(node: node.left!, min: min, max: node.value) {
        return false
    }
    
    if node.right != nil && !validate(node: node.right!, min: node.value, max: max) {
        return false
    }
    
    return true
}

print(validate(node: rootNode7, min: nil, max: nil))



