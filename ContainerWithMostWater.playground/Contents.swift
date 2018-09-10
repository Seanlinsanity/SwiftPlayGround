//: Playground - noun: a place where people can play

import UIKit
/*
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.

 Example:
 
 Input: [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: the area between index (1, 8)
*/

func maxArea(_ height: [Int]) -> Int {
    
    var maxArea = 0
    var left = 0
    var right = height.count - 1

    while(left < right) {
        let area = min(height[left], height[right]) * (right - left)
        maxArea = max(area, maxArea)

        if height[left] < height[right] {
            left += 1
        }else{
            right -= 1
        }
    }

    return maxArea

//    for i in 0...(height.count - 1) - 1 {
//        for j in i + 1...height.count - 1 {
//            let area = min(height[i], height[j]) * (j - i)
//            maxArea = max(area, maxArea)
//        }
//    }
//
//    return maxArea
    
}

maxArea([1,8,6,2,5,4,8,3,7])
 
 
