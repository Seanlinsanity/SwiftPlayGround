//: Playground - noun: a place where people can play

import UIKit

//1. Binary Tree
//
//        10
//       /  \
//      5    14
//     /    /  \
//    1    11  20


class Node{
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

let oneNode = Node(value: 1, leftChild: nil, rightChild: nil)
let fiveNode = Node(value: 5, leftChild: oneNode, rightChild: nil)
let elevenNode = Node(value: 11, leftChild: nil, rightChild: nil)
let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let fourteenNode = Node(value: 14, leftChild: elevenNode, rightChild: twentyNode)

let tenNode = Node(value: 10, leftChild: fiveNode, rightChild: fourteenNode)


func search(node: Node?, value: Int) -> Bool {
    print(Date().timeIntervalSince1970)
//    if node.value == value {
//        return true
//    }else if node.rightChild?.value == value || node.leftChild?.value == value{
//        return true
//    }else if node.rightChild != nil || node.leftChild != nil{
//        if node.rightChild != nil && node.leftChild != nil{
//            return search(node: node.rightChild!, value: value) || search(node: node.leftChild!, value: value)
//        }else if node.rightChild != nil{
//            return search(node: node.rightChild!, value: value)
//        }else{
//            return search(node: node.leftChild!, value: value)
//        }
//    }
//    return false
    
    if node == nil{
        return false
    }
    if node?.value == value {
        return true
    }else if value < node!.value{
        // improve the search efficiency
        return search(node: node?.leftChild, value: value)
    }else{
        return search(node: node?.rightChild, value: value)
    }
    
}

search(node: tenNode, value: 11)
