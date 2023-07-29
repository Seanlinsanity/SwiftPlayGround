import UIKit

/*
 Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string.

 Return the sorted string. If there are multiple answers, return any of them.

  

 Example 1:

 Input: s = "tree"
 Output: "eert"
 Explanation: 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
 Example 2:

 Input: s = "cccaaa"
 Output: "aaaccc"
 Explanation: Both 'c' and 'a' appear three times, so both "cccaaa" and "aaaccc" are valid answers.
 Note that "cacaca" is incorrect, as the same characters must be together.
 Example 3:

 Input: s = "Aabb"
 Output: "bbAa"
 Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.
  

 Constraints:

 1 <= s.length <= 5 * 105
 s consists of uppercase and lowercase English letters and digits.
 */

class Solution {
    struct Node: Comparable {
        let count: Int
        let char: Character
        init(_ char: Character, _ count: Int) {
            self.char = char
            self.count = count
        }

        static func < (lhs: Node, rhs: Node) -> Bool {
            return lhs.count > rhs.count
        }
    }

    func frequencySort(_ str: String) -> String {
        // edge case
        if str.count == 1 { return str }

        var charCountDict = [Character: Int]()
        for char in Array(str) {
            charCountDict[char] = charCountDict[char, default: 0] + 1
        }

        let heap = MinHeap<Node>()
        for (char, count) in charCountDict {
            heap.add(Node(char, count))
        }

        var sortChars = [Character]()
        while heap.size() > 0 {
            guard let node = heap.poll() else { return "" }
            let char = node.char
            let count = node.count
            for _ in 1...count {
                sortChars.append(char)
            }
        }

        return String(sortChars)
    }
}

Solution().frequencySort("tree")
Solution().frequencySort("cccaaa")
Solution().frequencySort("Aabb")


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
