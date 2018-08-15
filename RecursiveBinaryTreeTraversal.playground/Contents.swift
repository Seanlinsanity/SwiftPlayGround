//: Playground - noun: a place where people can play

import UIKit

class Node {
    
    let value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int){
        self.value = value
    }
    
}


let root = Node(value: 0)
root.left = Node(value: 1)
root.right = Node(value: 2)
root.left?.left = Node(value: 3)
root.left?.right = Node(value: 4)
root.right?.right = Node(value: 5)
root.left?.left?.left = Node(value: 6)
root.left?.left?.right = Node(value: 7)
root.right?.right?.left = Node(value: 8)
root.right?.right?.right = Node(value: 9)

func preorderTraversal(root: Node?) {
    if root == nil { return }
    //Depth-first Search
    print(root!.value)
    preorderTraversal(root: root?.left)
    preorderTraversal(root: root?.right)
    
}

preorderTraversal(root: root)

func inorderTraversal(root: Node?) {
    
    if root == nil { return }
    
    inorderTraversal(root: root?.left)
    print(root!.value)
    inorderTraversal(root: root?.right)
    
}

//inorderTraversal(root: root)

func postorderTraversal(root: Node?) {
    if root == nil { return }
    
    postorderTraversal(root: root?.left)
    postorderTraversal(root: root?.right)
    print(root!.value)
}

//postorderTraversal(root: root)
