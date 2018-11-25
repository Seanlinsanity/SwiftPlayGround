import UIKit

let str1 = "This algorithm is awesome"
let str2 = "The algorithm is super awesome"

func findLongestCommonSubsequence(str1: String, str2: String) -> String {
    
    var memo = Array(repeating: Array(repeating: "nil", count: str2.count), count: str1.count)
    return helper(characters1: Array(str1), characters2: Array(str2), i: 0, j: 0, memo: &memo)

}

func helper(characters1: [Character], characters2: [Character], i: Int, j: Int, memo: inout [[String]]) -> String{
    if i == characters1.count || j == characters2.count {
        print(i, j, "end")
        return ""
    }
    
    if memo[i][j] != "nil" {
        print(i, j ,memo[i][j])
        return memo[i][j]
    }
    
    if characters1[i] == characters2[j] {
        memo[i][j] = String(characters1[i]) + helper(characters1: characters1, characters2: characters2, i: i + 1, j: j + 1, memo: &memo)
        print(i, j, "new: \(memo[i][j])" )
        return memo[i][j]
    }else{
        let resultA = helper(characters1: characters1, characters2: characters2, i: i + 1, j: j, memo: &memo)
        let resultB = helper(characters1: characters1, characters2: characters2, i: i, j: j + 1, memo: &memo)
        
        print(i, j, resultA, resultB)
        if resultA.count >= resultB.count {
            memo[i][j] = resultA
            return resultA
        }else {
            memo[i][j] = resultB
            return resultB
        }
    }
    
}

findLongestCommonSubsequence(str1: str1, str2: str2)
//findLongestCommonSubsequence(str1: "AAAA", str2: "BBB")

/*
 Naive Recursion
 Time complexity = O(pow(2, str1.length + str2.length))
 
 Dynamic Programming
 Time complexity = O(str1.length * str2.length)
*/
