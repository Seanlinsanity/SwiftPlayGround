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

class Stack {
    
    var data = [Node]()
    
    func push(_ data: Node){
        self.data.append(data)
    }
    
    func pop() -> Node? {
        if self.data.count == 0 {
            return nil
        }
        let node = self.data.remove(at: self.data.count - 1)
        return node
    }
    
    func count() -> Int {
        return data.count
    }
    
}


func iterativeInorderTraversal(root: Node) -> [Int]{
    
    var results = [Int]()
    let stack = Stack()
    var currentRoot: Node? = root
    
    while(currentRoot != nil || stack.count() != 0){
        if currentRoot != nil {
            stack.push(currentRoot!)
            currentRoot = currentRoot!.left
        }else{
            let popNode = stack.pop()
            print(popNode!.value)
            results.append(popNode!.value)
            currentRoot = popNode!.right
        }
        
    }
    return results
}

print("inorder traversal: ", iterativeInorderTraversal(root: root))



func iterativePostorder(root: Node) -> [Int]{
    
    let stack1 = Stack()
    let stack2 = Stack()
    
    stack1.push(root)
    
    while (stack1.count() > 0) {
        
        let popNode = stack1.pop()
        stack2.push(popNode!)
        
        if popNode?.left != nil {
            stack1.push(popNode!.left!)
        }
        if popNode?.right != nil {
            stack1.push(popNode!.right!)
        }
        
    }
    
    var results = [Int]()
    while (stack2.count() > 0) {
        let popvalue = stack2.pop()!.value
        print(popvalue)
        results.append(popvalue)
    }
    
    return results
}

print("postorder traversal: ", iterativePostorder(root: root))






















