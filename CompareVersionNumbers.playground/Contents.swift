import UIKit

/*
Compare two version numbers version1 and version2.
If version1 > version2 return 1; if version1 < version2 return -1;otherwise return 0.

You may assume that the version strings are non-empty and contain only digits and the . character.
The . character does not represent a decimal point and is used to separate number sequences.
For instance, 2.5 is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.

Example 1:

Input: version1 = "0.1", version2 = "1.1"
Output: -1
Example 2:

Input: version1 = "1.0.1", version2 = "1"
Output: 1
Example 3:

Input: version1 = "7.5.2.4", version2 = "7.5.3"
Output: -1
 */

func compareVersion(_ version1: String, _ version2: String) -> Int {
    
    let version1Nums = version1.components(separatedBy: ".")
    let version2Nums = version2.components(separatedBy: ".")
    
    let count = min(version1Nums.count, version2Nums.count)
    
    for i in 0...count - 1{
        if Int(version1Nums[i])! < Int(version2Nums[i])!{
            return -1
        }else if Int(version1Nums[i])! > Int(version2Nums[i])!{
            return 1
        }
    }
    
    if version1Nums.count > version2Nums.count{
        let numsArr = Array(version1Nums[count..<version1Nums.count])
        for num in numsArr{
            if Int(num)! > 0{
                return 1
            }
        }
        return 0
        
    }else if  version1Nums.count < version2Nums.count{
        let numsArr = Array(version2Nums[count..<version2Nums.count])
        for num in numsArr{
            if Int(num)! > 0{
                return -1
            }
        }
        return 0
    }else{
        return 0
    }
    
}

compareVersion("0.1", "1.1")
compareVersion("1.0.1", "1")
compareVersion("7.5.2.4", "7.5.3")
compareVersion("01.0.0.0.1", "1.0")
