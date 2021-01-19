import UIKit

final class Atomic<A> {
    private let queue = DispatchQueue(label: "com.linepay.pfms.atomic-queue")
    private var _value: A
    
    init(_ value: A) {
        _value = value
    }
    
    func mutate(_ transform: (inout A) -> Void) {
        queue.sync { transform(&self._value) }
    }
    
    var value: A {
        queue.sync { _value }
    }
}

let atomicStr = Atomic<String>("")
print(atomicStr.value)
atomicStr.mutate { (str) in
    str.append("hello")
}
print(atomicStr.value)
atomicStr.mutate { (str) in
    str.append(" world!")
}
print(atomicStr.value)

class Person {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person = Atomic<Person>(Person(name: "Sean", age: 27))
print(person.value.age)
person.mutate { (p) in
    p.age = 30
}
print(person.value.age)
