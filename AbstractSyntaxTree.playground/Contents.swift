//: Playground - noun: a place where people can play

import UIKit

//  5 + 25 * 6

//      "+"
//     /   \
//   "*"    5
//   / \
//  25  6
//
// represent the equation in a tree

class Node{
    var operation: String?
    var value : Float?
    var leftChild: Node?
    var rightChild: Node?
    
    init(operation: String?, value: Float?, leftChild: Node?, rightChild: Node?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

let twentyfiveNode = Node(operation: nil, value: 25, leftChild: nil, rightChild: nil)
let sixNode = Node(operation: nil, value: 6, leftChild: nil, rightChild: nil)
let fiveNode = Node(operation: nil, value: 5, leftChild: nil, rightChild: nil)
let plus25_6Node = Node(operation: "+", value: nil, leftChild: twentyfiveNode, rightChild: sixNode)
let rootMultiplyNode = Node(operation: "*", value: nil, leftChild: plus25_6Node, rightChild: fiveNode)

func evaluate(node: Node) -> Float{

    if node.value != nil {
        return node.value!
    }
    if node.operation == "+"{
        return evaluate(node: node.leftChild!) + evaluate(node: node.rightChild!)
    }else if node.operation == "*" {
        return evaluate(node: node.leftChild!) * evaluate(node: node.rightChild!)
    }else if node.operation == "-" {
        return evaluate(node: node.leftChild!) - evaluate(node: node.rightChild!)
    }else if node.operation == "/" {
        if node.rightChild?.value == 0 {
            return 0000000
        }
        return evaluate(node: node.leftChild!) / evaluate(node: node.rightChild!)
    }
    
    
    return 0
}

evaluate(node: rootMultiplyNode)






