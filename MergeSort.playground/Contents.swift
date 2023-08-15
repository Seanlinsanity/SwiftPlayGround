//: Playground - noun: a place where people can play

import UIKit

func mergeSort(_ nums: [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }
    
    let mid = nums.count / 2
    let left = Array(nums[0..<mid])
    let right = Array(nums[mid..<nums.count])
    return merge(mergeSort(left), mergeSort(right))
}


func merge(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var index1 = 0
    var index2 = 0
    
    var merged = [Int]()
    while index1 < nums1.count && index2 < nums2.count {
        if nums1[index1] < nums2[index2] {
            merged.append(nums1[index1])
            index1 += 1
        } else {
            merged.append(nums2[index2])
            index2 += 1
        }
    }
    
    if index1 < nums1.count {
        for index in index1..<nums1.count {
            merged.append(nums1[index])
        }
    }
    
    if index2 < nums2.count {
        for index in index2..<nums2.count {
            merged.append(nums2[index])
        }
    }
    
    return merged
}

mergeSort([3,1,12,6,7,10,11])
mergeSort([18,3,0,12,6,7,10,11])
mergeSort([3,1])
mergeSort([3,1,2])
mergeSort([1])
mergeSort([30,2,3,4,-1,5,9,11])



