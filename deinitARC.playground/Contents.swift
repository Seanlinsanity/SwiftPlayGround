
import UIKit

var str = "Hello, playground"

class Person {
    var name: String
    init (name: String) {
        self.name = name
    }
    
    deinit {
        print("deinit: \(name)")
    }
}

var sean: Person? = Person(name: "Sean")
var curry: Person? = Person(name: "Curry")
curry = sean
