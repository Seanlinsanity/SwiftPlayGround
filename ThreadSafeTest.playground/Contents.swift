import UIKit

let queue = DispatchQueue.global()
var arr = [Int]()
for i in 0..<10000 {
    queue.async {
        print("add \(i)")
        arr.append(i)
    }
}
