import UIKit

/*
 There are ‘N’ tasks, labeled from ‘0’ to ‘N-1’. Each task can have some prerequisite tasks which need to be completed before it can be scheduled. Given the number of tasks and a list of prerequisite pairs, write a method to print all possible ordering of tasks meeting all prerequisites.

 Example 1:

 Input: Tasks=3, Prerequisites=[0, 1], [1, 2]
 Output: [0, 1, 2]
 Explanation: There is only possible ordering of the tasks.
 Example 2:

 Input: Tasks=4, Prerequisites=[3, 2], [3, 0], [2, 0], [2, 1]
 Output:
 1) [3, 2, 0, 1]
 2) [3, 2, 1, 0]
 Explanation: There are two possible orderings of the tasks meeting all prerequisites.
 Example 3:

 Input: Tasks=6, Prerequisites=[2, 5], [0, 5], [0, 4], [1, 4], [3, 2], [1, 3]
 Output:
 1) [0, 1, 4, 3, 2, 5]
 2) [0, 1, 3, 4, 2, 5]
 3) [0, 1, 3, 2, 4, 5]
 4) [0, 1, 3, 2, 5, 4]
 5) [1, 0, 3, 4, 2, 5]
 6) [1, 0, 3, 2, 4, 5]
 7) [1, 0, 3, 2, 5, 4]
 8) [1, 0, 4, 3, 2, 5]
 9) [1, 3, 0, 2, 4, 5]
 10) [1, 3, 0, 2, 5, 4]
 11) [1, 3, 0, 4, 2, 5]
 12) [1, 3, 2, 0, 5, 4]
 13) [1, 3, 2, 0, 4, 5]
 */

class Solution {
    var result = [[Int]]()
    func allCourseSchedules(_ courses: Int, _ prerequisites: [[Int]]) -> [[Int]] {
        var adjGraph = [Int: [Int]]()
        var incomingCount = [Int: Int]()
            for prerequisite in prerequisites {
            let from = prerequisite[0]
            let to = prerequisite[1]
            adjGraph[from] = adjGraph[from, default: []] + [to]
            incomingCount[to] = incomingCount[to, default: 0] + 1
        }

        var sources = [Int]()
        for course in 0..<courses {
            let count = incomingCount[course] ?? 0
            if count == 0 {
                sources.append(course)
            }
        }

        backTracking([], sources, adjGraph, incomingCount)
        return result
    }

    func backTracking(_ order: [Int], _ sources: [Int], _ adjGraph: [Int: [Int]], _ incomingCount: [Int: Int]) {
        if sources.count == 0 {
            result.append(order)
            return
        }

        for index in 0..<sources.count {
            var newSources = sources
            var newOrder = order
            var newIncomingCount = incomingCount
            let course = newSources[index]
            newSources.remove(at: index)
            newOrder.append(course)
            if let adjList = adjGraph[course] {
                for adj in adjList {
                    let count = newIncomingCount[adj, default: 0] - 1
                    newIncomingCount[adj] = count
                    if count == 0 {
                        newSources.append(adj)
                    }
                }
            }
            backTracking(newOrder, newSources, adjGraph, newIncomingCount)
        }
    }

}

Solution().allCourseSchedules(3, [[0, 1], [1, 2]])
Solution().allCourseSchedules(4, [[3, 2], [3, 0], [2, 0], [2, 1]])
Solution().allCourseSchedules(6, [[2, 5], [0, 5], [0, 4], [1, 4], [3, 2], [1, 3]])
