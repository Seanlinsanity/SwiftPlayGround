import UIKit
/*
The gray code is a binary numeral system where two successive values differ in only one bit.

Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0.

Example 1:

Input: 2
Output: [0,1,3,2]
Explanation:
00 - 0
01 - 1
11 - 3
10 - 2

For a given n, a gray code sequence may not be uniquely defined.
For example, [0,2,3,1] is also a valid gray code sequence.

00 - 0
10 - 2
11 - 3
01 - 1
Example 2:

Input: 0
Output: [0]
Explanation: We define the gray code sequence to begin with 0.
             A gray code sequence of n has size = 2n, which for n = 0 the size is 20 = 1.
             Therefore, for n = 0 the gray code sequence is [0].
 */



func grayCode(_ n: Int) -> [Int] {
    var set = Set<String>()
    var arr = [String]()

    let total = Int(pow(2, Double(n)))
    var last = String(Array(repeating: "0", count: n))

    set.insert(last)
    arr.append(last)

    for _ in 0..<total {
        for j in 0..<last.count {
            var new = Array(last)
            new[j] = new[j] == "0" ? "1" : "0"
            let newStr = String(new)
            if set.contains(newStr) == false {
                set.insert(newStr)
                arr.append(newStr)
                print(newStr)
                last = newStr
                break
            }
        }
    }

    var seq = [Int]()

    for num in arr {
        var val = 0
        for (i,char) in num.enumerated().reversed() {
            if char == "1" {
                val += Int(pow(2, Double(n-1-i)))
            }
        }
        seq.append(val)
    }

    return seq

}

grayCode(2)
grayCode(3)
grayCode(4)
