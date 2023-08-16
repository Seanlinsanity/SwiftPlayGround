import UIKit

/*
 The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.

 For example, for arr = [2,3,4], the median is 3.
 For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
 Implement the MedianFinder class:

 MedianFinder() initializes the MedianFinder object.
 void addNum(int num) adds the integer num from the data stream to the data structure.
 double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
  

 Example 1:

 Input
 ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
 [[], [1], [2], [], [3], []]
 Output
 [null, null, null, 1.5, null, 2.0]

 Explanation
 MedianFinder medianFinder = new MedianFinder();
 medianFinder.addNum(1);    // arr = [1]
 medianFinder.addNum(2);    // arr = [1, 2]
 medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
 medianFinder.addNum(3);    // arr[1, 2, 3]
 medianFinder.findMedian(); // return 2.0
  

 Constraints:

 -105 <= num <= 105
 There will be at least one element in the data structure before calling findMedian.
 At most 5 * 104 calls will be made to addNum and findMedian.
  

 Follow up:

 If all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
 If 99% of all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
 */

struct MinNode: Comparable {
    let val: Int
    init(_ val: Int) {
        self.val = val
    }

    static func < (lhs: MinNode, rhs: MinNode) -> Bool {
        return lhs.val < rhs.val
    }
}

struct MaxNode: Comparable {
    let val: Int
    init(_ val: Int) {
        self.val = val
    }

    static func < (lhs: MaxNode, rhs: MaxNode) -> Bool {
        return lhs.val > rhs.val
    }
}

class Heap<Node: Comparable> {
    private var list: [Node]

    init() {
        list = [Node]()
    }

    func add(_ node: Node) {
        list.append(node)
        heapifyUp(list.count - 1)
    }

    func peek() -> Node? {
        if list.count == 0 { return nil }
        return list[0]
    }

    func poll() -> Node? {
    if list.count == 0 { return nil }

        let node = list[0]
        swap(0, list.count - 1)
        list.removeLast()
        heapifyDown()
        return node
    }

    func size() -> Int {
        return list.count
    }

    private func parentIndex(_ index: Int) -> Int? {
        if index >= list.count ||  index <= 0 { return nil }
        return (index - 1) / 2
    }

    private func parent(_ index: Int) -> Node? {
        guard let parentIndex = parentIndex(index) else { return nil }
        return list[parentIndex]
    }

    private func leftChild(_ index: Int) -> Node? {
        let childIndex = index * 2 + 1
        if childIndex < list.count {
            return list[childIndex]
        }

        return nil
    }

    private func rightChild(_ index: Int) -> Node? {
        let childIndex = index * 2 + 2
        if childIndex < list.count {
            return list[childIndex]
        }

        return nil
    }

    private func heapifyDown() {
        if list.count <= 1 { return }
        
        var current = 0
        while current <= (list.count  - 1) / 2 {
            let node = list[current]
            let leftNode = leftChild(current)
            let rightNode = rightChild(current)

            var smallestNode = node
            var shouldSwapLeft: Bool?
            if let leftNode = leftNode, leftNode < smallestNode {
                smallestNode = leftNode
                shouldSwapLeft = true
            }

            if let rightNode = rightNode, rightNode < smallestNode {
                smallestNode = rightNode
                shouldSwapLeft = false
            }

            guard let shouldSwapLeft = shouldSwapLeft else { return }
            if shouldSwapLeft {
                swap(current, current * 2 + 1)
                current = current * 2 + 1
            } else {
                swap(current, current * 2 + 2)
                current = current * 2 + 2
            }
        }
    }

    private func heapifyUp(_ index: Int) {
        var current = index
        while current > 0 {
            guard let parentIndex = parentIndex(current), let parentNode = parent(current) else { return }
            if parentNode <= list[current] {
                break
            }

            swap(current, parentIndex)
            current = parentIndex
        }
    }

    private func swap(_ index1: Int, _ index2: Int) {
        let temp = list[index1]
        list[index1] = list[index2]
        list[index2] = temp
    }

}

class MedianFinder {
    let minHeap = Heap<MinNode>()
    let maxHeap = Heap<MaxNode>()

    init() {}

    func addNum(_ num: Int) {
        if maxHeap.size() == 0 {
            maxHeap.add(MaxNode(num))
            return
        }

        guard let maxNode = maxHeap.peek() else { return }
        if num > maxNode.val {
            minHeap.add(MinNode(num))
        } else {
            maxHeap.add(MaxNode(num))
        }

        balance()
    }

    func findMedian() -> Double {
        if maxHeap.size() == minHeap.size() {
        guard let maxNode = maxHeap.peek(), let minNode = minHeap.peek() else { return 0 }
            return (Double(maxNode.val) + Double(minNode.val)) / 2
        }

        if maxHeap.size() > minHeap.size() {
            guard let maxNode = maxHeap.peek() else { return 0 }
            return Double(maxNode.val)
        }

        guard let minNode = minHeap.peek() else { return 0 }
        return Double(minNode.val)
    }

    private func balance() {
        if abs(maxHeap.size() - minHeap.size()) <= 1 { return }

        if maxHeap.size() > minHeap.size() {
            guard let maxNode = maxHeap.poll() else { return }
            minHeap.add(MinNode(maxNode.val))
        } else {
            guard let minNode = minHeap.poll() else { return }
            maxHeap.add(MaxNode(minNode.val))
        }
    }

}

let medianFinder = MedianFinder()
medianFinder.addNum(1)
medianFinder.addNum(2)
medianFinder.findMedian()
medianFinder.addNum(3)
medianFinder.findMedian()
