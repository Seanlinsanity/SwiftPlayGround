import UIKit

extension Array {
    subscript(safe index: Int) -> Element? {
        print("array indices: ", indices)
        return indices ~= index ? self[index] : nil
    }
    mutating func safeChange(_ newElement: Element, at index: Int) {
        guard index < count else { return }
        self[index] = newElement
    }
}

let arr = [11, 30, 24, 8, 34]
print(arr[safe: 100])
print(arr[safe: 1])


let value = -3
if 0...100 ~= value {
   print("inside range")
} else if 101... ~= value {
    print("beyond range max")
} else if ..<0 ~= value {
    print("less range min")
}
