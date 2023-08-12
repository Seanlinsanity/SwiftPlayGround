import UIKit

/*
 You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [starti, endi] and secondList[j] = [startj, endj]. Each list of intervals is pairwise disjoint and in sorted order.

 Return the intersection of these two interval lists.

 A closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.

 The intersection of two closed intervals is a set of real numbers that are either empty or represented as a closed interval. For example, the intersection of [1, 3] and [2, 4] is [2, 3].

  

 Example 1:


 Input: firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]
 Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
 Example 2:

 Input: firstList = [[1,3],[5,9]], secondList = []
 Output: []
  

 Constraints:

 0 <= firstList.length, secondList.length <= 1000
 firstList.length + secondList.length >= 1
 0 <= starti < endi <= 109
 endi < starti+1
 0 <= startj < endj <= 109
 endj < startj+1
 */


class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var firstIndex = 0
        var secondIndex = 0

        while firstIndex < firstList.count && secondIndex < secondList.count {
            let interval1 = firstList[firstIndex]
            let interval2 = secondList[secondIndex]
            let start1 = interval1[0]
            let end1 = interval1[1]
            let start2 = interval2[0]
            let end2 = interval2[1]

            if !(end1 < start2 || start1 > end2) {
                // overlap
                result.append([max(start1, start2), min(end1, end2)])
            }

            if end1 > end2 {
                secondIndex += 1
            } else if end2 > end1 {
                firstIndex += 1
            } else {
                firstIndex += 1
                secondIndex += 1
            }
        }

        return result
    }
}

Solution().intervalIntersection([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]])
Solution().intervalIntersection([[1,3],[5,9]], [])

