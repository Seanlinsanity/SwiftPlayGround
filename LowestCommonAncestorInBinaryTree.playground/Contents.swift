//: Playground - noun: a place where people can play

import UIKit

class Node {
    
    let value: Int
    var left: Node?
    var right: Node?
    init(value: Int) {
        self.value = value
    }
    
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
let node5 = Node(value: 5)
let node6 = Node(value: 6)
let node7 = Node(value: 7)
node1.left = node2
node1.right = node3
node2.left = node4
node2.right = node5
node3.left = node6
node3.right = node7
node4.left = Node(value: 10)
node4.right = Node(value: 11)


func lowestCommonAncestor(value1: Int, value2: Int, root: Node?) -> Int? {
    var parents1 = [Int]()
    if !(findvalue(value: value1, node: node1, parents: &parents1)) { return nil}
    
    var parents2 = [Int]()
    if !(findvalue(value: value2, node: node1, parents: &parents2)) { return nil }
    
    return getValue(one: parents1, two: parents2)
    
}

func findvalue(value: Int, node: Node?, parents: inout [Int]) -> Bool {
    
    if node == nil {
        return false
    }
    if node!.value == value {
        return true
    }
    if node!.left != nil && findvalue(value: value, node: node!.left, parents: &parents){
        parents.insert(node!.value, at: 0)
        return true
    }
    if node!.right != nil && findvalue(value: value, node: node!.right, parents: &parents){
        parents.insert(node!.value, at: 0)
        return true
    }
    return false
    
}

func getValue(one: [Int], two: [Int]) -> Int?{
    
    if one.count == 0 || two.count == 0{
        return nil
    }
    
    let count = one.count <= two.count ? one.count : two.count
    
    var index = 0
    for i in 0..<count {
        if one[i] != two[i]{
            break
        }
        index = i
    }
    
    return one[index]
    
}


var parents1 = [Int]()
print(findvalue(value: 10, node: node1, parents: &parents1))
print(parents1)

//var parents2 = [Int]()
//print(findvalue(value: 6, node: node1, parents: &parents2))
//print(parents2)


//print(getValue(one: parents1, two: parents2) ?? "nil")


print(lowestCommonAncestor(value1: 11, value2: 10, root: node1) ?? "nil")



func optimalLCA(root: Node?, value1: Int, value2: Int) -> Node? {
    //it doesn't work if one of the two value doesn't exist in the tree
    if root == nil {
        return nil
    }
    
    if root!.value == value1 || root!.value == value2 {
        return root
    }
    
    let leftNode = optimalLCA(root: root!.left, value1: value1, value2: value2)
    let rightNode = optimalLCA(root: root!.right, value1: value1, value2: value2)
    
    if leftNode != nil && rightNode != nil{
        return root
    }
    
    if leftNode == nil {
        return rightNode
    }
    
    if rightNode == nil {
        return leftNode
    }
    
    return nil
}

print(optimalLCA(root: node1, value1: 11, value2: 10)?.value ?? "nil")







