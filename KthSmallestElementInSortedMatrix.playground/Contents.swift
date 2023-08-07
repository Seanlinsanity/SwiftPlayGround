import UIKit

/*
 Given an n x n matrix where each of the rows and columns is sorted in ascending order, return the kth smallest element in the matrix.

 Note that it is the kth smallest element in the sorted order, not the kth distinct element.

 You must find a solution with a memory complexity better than O(n2).

  

 Example 1:

 Input: matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
 Output: 13
 Explanation: The elements in the matrix are [1,5,9,10,11,12,13,13,15], and the 8th smallest number is 13
 Example 2:

 Input: matrix = [[-5]], k = 1
 Output: -5
  

 Constraints:

 n == matrix.length == matrix[i].length
 1 <= n <= 300
 -109 <= matrix[i][j] <= 109
 All the rows and columns of matrix are guaranteed to be sorted in non-decreasing order.
 1 <= k <= n2
 */


class Solution {
    struct Node: Comparable {
        let val: Int
        let row: Int
        let column: Int

        init(_ val: Int, _ row: Int, _ column: Int) {
            self.val = val
            self.row = row
            self.column = column
        }

        static func < (lhs: Node, rhs: Node) -> Bool {
            return lhs.val < rhs.val
        }
    }

    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        if matrix.count == 1 { return matrix[0][0] }

        let rows = matrix.count
        let columns = matrix[0].count
        var count = 0
        var result = Int.min
        let minHeap = MinHeap<Node>()
        for row in 0..<rows {
            minHeap.add(Node(matrix[row][0], row, 0))
        }

        while minHeap.size() > 0 {
            guard let node = minHeap.poll() else { return 0 }
            count += 1
            result = node.val
            if count == k {
                    return result
            }
            if node.column < columns - 1 {
                minHeap.add(Node(matrix[node.row][node.column + 1], node.row, node.column + 1))
            }
        }

        return result
    }
}

Solution().kthSmallest([[1,5,9],[10,11,13],[12,13,15]], 8)
Solution().kthSmallest([[-5]], 1)

public class MinHeap<T: Comparable> {
    private var nodes = [T]()

    public func size() -> Int {
        return nodes.count
    }

    public func peek() -> T? {
        return nodes.first
    }

    public func leftChildIndex(_ index: Int) -> Int? {
        let leftIndex = index * 2 + 1
        return leftIndex < nodes.count ? leftIndex : nil
    }

    public func rightChildIndex(_ index: Int) -> Int? {
        let rightIndex = index * 2 + 2
        return rightIndex < nodes.count ? rightIndex : nil
    }

    public func parent(_ index: Int) -> Int? {
        if index == 0 {
            return nil
        }
        return (index - 1) / 2
    }

    public func add(_ element: T) {
        nodes.append(element)
        heapifyUp()
    }

    public func poll() -> T? {
        if nodes.isEmpty {
            return nil
        }

        swap(0, nodes.count - 1)
        let num = nodes.removeLast()
        heapifyDown()
        return num
    }

    private func swap(_ index1: Int, _ index2: Int) {
        let temp = nodes[index1]
        nodes[index1] = nodes[index2]
        nodes[index2] = temp
    }

    private func heapifyUp() {
        var current = nodes.count - 1
        while let parentIndex = parent(current), nodes[current] < nodes[parentIndex] {
            swap(current, parentIndex)
            current = parentIndex
        }
    }

    private func heapifyDown() {
        var current = 0
        while true {
            let left = leftChildIndex(current)
            let right = rightChildIndex(current)

            var minIndex = current
            if let left = left, nodes[left] < nodes[minIndex] {
                minIndex = left
            }

            if let right = right, nodes[right] < nodes[minIndex] {
                minIndex = right
            }

            if minIndex == current {
                break
            }

            swap(minIndex, current)
            current = minIndex
        }
    }
}
