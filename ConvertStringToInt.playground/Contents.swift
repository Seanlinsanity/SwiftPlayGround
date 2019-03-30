import UIKit

var str = "38912420"

func convert(str: String) -> Int? {
    var total = 0
    let valueMap = [ "1" as Character: 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "0": 0 ]
    
    for (i, c) in str.enumerated() {
        let exponent = str.count - i - 1
        if let value = valueMap[c] {
            total += NSDecimalNumber(decimal: Decimal(value) * pow(10, exponent)).intValue
        }else{
            return nil
        }
    }
    
    return total
}

convert(str: str)
