import UIKit

/*
 Given a sequence originalSeq and an array of sequences, write a method to find if originalSeq can be uniquely reconstructed from the array of sequences.

 Unique reconstruction means that we need to find if originalSeq is the only sequence such that all sequences in the array are subsequences of it.

 Example 1:

 Input: originalSeq: [1, 2, 3, 4], seqs: [[1, 2], [2, 3], [3, 4]]
 Output: true
 Explanation: The sequences [1, 2], [2, 3], and [3, 4] can uniquely reconstruct
 [1, 2, 3, 4], in other words, all the given sequences uniquely define the order of numbers
 in the 'originalSeq'.
 Example 2:

 Input: originalSeq: [1, 2, 3, 4], seqs: [[1, 2], [2, 3], [2, 4]]
 Output: false
 Explanation: The sequences [1, 2], [2, 3], and [2, 4] cannot uniquely reconstruct
 [1, 2, 3, 4]. There are two possible sequences we can construct from the given sequences:
 1) [1, 2, 3, 4]
 2) [1, 2, 4, 3]
 Example 3:

 Input: originalSeq: [3, 1, 4, 2, 5], seqs: [[3, 1, 5], [1, 4, 2, 5]]
 Output: true
 Explanation: The sequences [3, 1, 5] and [1, 4, 2, 5] can uniquely reconstruct
 [3, 1, 4, 2, 5].
 
 Input:org = [1,2,3], seqs = [[1,2],[1,3]]
 Output: false
 Explanation:
 [1,2,3] is not the only one sequence that can be reconstructed, because [1,3,2] is also a valid sequence that can be reconstructed.
 
 Input: org = [1,2,3], seqs = [[1,2]]
 Output: false
 Explanation:
 The reconstructed sequence can only be [1,2], can't reconstruct the sequence [1,2,3].
 
 Input: org = [1,2,3], seqs = [[1,2],[1,3],[2,3]]
 Output: true
 Explanation:
 The sequences [1,2], [1,3], and [2,3] can uniquely reconstruct the original sequence [1,2,3].
 
 Input:org = [4,1,5,2,6,3], seqs = [[5,2,6,3],[4,1,5,2]]
 Output:true
 
 */

class Solution {
    func sequenceReconstruction(_ org: [Int], _ seqs: [[Int]]) -> Bool {
        // build graph and incoming degree
        var incomingCount = [Int: Int]()
        var adjGraph = [Int: [Int]]()
        for seq in seqs {
            if seq.count <= 1 { continue }
            for index in 0..<seq.count - 1 {
                let from = seq[index]
                let to = seq[index + 1]
                adjGraph[from] = adjGraph[from, default: []] + [to]
                incomingCount[to] = incomingCount[to, default: 0] + 1
            }
        }

        var sources = [Int]()
        for num in org {
            if incomingCount[num] == nil {
                sources.append(num)
            }
        }

        var result = [Int]()
        while sources.count > 0 {
            if sources.count != 1 { return false }
            
            let source = sources[0]
            result.append(source)
            var newSources = [Int]()
            if let adjList = adjGraph[source] {
                for adj in adjList {
                    let count = incomingCount[adj, default: 0] - 1
                    incomingCount[adj] = count
                    if count == 0 {
                        newSources.append(adj)
                    }
                }
            }
            sources = newSources
        }

        // validate cycle
        if result.count != org.count { return false }

        return result == org

    }

}

Solution().sequenceReconstruction([1, 2, 3, 4], [[1, 2], [2, 3], [3, 4]])
Solution().sequenceReconstruction([1, 2, 3, 4], [[1, 2], [2, 3], [2, 4]])
Solution().sequenceReconstruction([3, 1, 4, 2, 5], [[3, 1, 5], [1, 4, 2, 5]])
Solution().sequenceReconstruction([1,2,3], [[1,2],[1,3]])
Solution().sequenceReconstruction([1,2,3], [[1,2]])
Solution().sequenceReconstruction([1,2,3], [[1,2],[1,3],[2,3]])
Solution().sequenceReconstruction([4,1,5,2,6,3], [[5,2,6,3],[4,1,5,2]])
