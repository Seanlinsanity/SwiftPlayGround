import UIKit

//var arrA = [Int]()
//var arrB = [Int]()
//let lockA = NSLock()
//let lockB = NSLock()
//let myQueueA = DispatchQueue(label: "my.queue.a")
//let myQueueB = DispatchQueue(label: "my.queue.b")
//
//for i in 0..<100 {
//    myQueueA.async {
//        lockA.lock()
//        lockB.lock()
//        arrA.append(i)
//        arrB.append(i * 2)
//        lockB.unlock()
//        lockA.unlock()
//    }
//}
//
//for _ in 0..<100 {
//    myQueueB.async {
//        lockB.lock()
//        lockA.lock()
//        if !arrA.isEmpty {
//            arrA.removeLast()
//        }
//        if !arrB.isEmpty {
//            arrB.removeLast()
//        }
//        lockA.unlock()
//        lockB.unlock()
//    }
//}
//
//
//func startDispatchQueueLock() {
//    let anotherQueue = DispatchQueue(label: "my.serial.queue", qos: .default)
//
//    anotherQueue.async {
//        anotherQueue.sync {
//            for i in 0..<10000 {
//                print("loop number: \(i)")
//            }
//        }
//        print("after sync")
//    }
//}

//func startRaceCondition() {
//    var numbers = [Int]()
//
//    let myqueueA = DispatchQueue(label: "my.queue.a")
//    let myQueueB = DispatchQueue(label: "my.queue.b")
//
//    myqueueA.async {
//        for i in 0...10000 {
//            numbers.append(i)
//        }
//    }
//
//    myQueueB.async {
//        repeat {
//            for num in numbers {
//                print("number: \(num)")
//            }
//        } while (true)
//    }
//
//}

//startRaceCondition()
//startDispatchQueueLock()

struct IPhone {
    static var stock = 2000
}

class AppleStore {
    let location: String
    
    init(location: String) {
        self.location = location
    }
    
    func sell(value: Int) {
        print("\(location): start transaction process...")
        if IPhone.stock > value {
            // sleeping for some random time to simulate server process
            Thread.sleep(forTimeInterval: Double.random(in: 0...1))
            IPhone.stock -= value
            print("\(location): \(value) has been sold")
            print("current balance is \(IPhone.stock)")
            if IPhone.stock < 0 {
                print("there is a stock issue")
            }
        } else {
            print("\(location): Can't sell: insufficent balance")
        }
    }
}

func testRaceCondition() {
    let appleStoreUS = AppleStore(location: "US")
    let appleStoreTW = AppleStore(location: "TW")
    let globalQueue = DispatchQueue.global()
    let queue = DispatchQueue(label: "sellQueue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 0)
    
    globalQueue.async {
        queue.async{
            appleStoreUS.sell(value: 1000)
            semaphore.signal()
        }
        semaphore.wait()

        queue.async{
            appleStoreTW.sell(value: 1500)
            semaphore.signal()
        }
        semaphore.wait()
    }
}

testRaceCondition()

