import UIKit

func sum(numbers: [Int]) -> Int {
    return numbers.reduce(0, {$0 + $1})
}

sum(numbers: [2, 7, 19, 5, 3])

extension Array where Element: Numeric {
    
    func customSum() -> Element{
        return self.reduce(0, {$0 + $1})
    }
    
}

[2, 7, 19, 5, 3].customSum()
[2.0, 7.0, 19.0, 5.0, 3.0].customSum()

extension Array where Element == String{
    func concatenate() -> String {
        return self.reduce("", {$0 + $1 + " "})
    }
}

print(["Hello", "From", "Sean", "Lin"].concatenate())
