import UIKit

class DownloadTaskOperation: Operation {
    private var task : URLSessionDataTask!
    
    //1.
    enum OperationState : Int {
        case isReady
        case isExecuting
        case isFinished
    }
    
    //2.
    private var state : OperationState = .isReady {
        willSet {
            self.willChangeValue(forKey: "isExecuting")
            self.willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            self.didChangeValue(forKey: "isExecuting")
            self.didChangeValue(forKey: "isFinished")
        }
    }
    
    //3.
    override var isReady: Bool { return state == .isReady }
    override var isExecuting: Bool { return state == .isExecuting }
    override var isFinished: Bool { return state == .isFinished }

    //4.
    init(url: String, completion: @escaping (UIImage?, Error?) -> ()) {
        super.init()
        guard let url = URL(string: url) else { return }
        task = URLSession.shared.dataTask(with: url, completionHandler: {  [weak self] (data, resp, err) in
            //6.
            if (self?.isCancelled == true) {
                print("Don't have to update UI")
                self?.state = .isFinished
                return
            }

            if let err = err {
                completion(nil, err)
                self?.state = .isFinished
                return
            }
            
            if let imageData = data {
                completion(UIImage(data: imageData), nil)
            } else {
                completion(nil, NSError(domain: "download task operation", code: 0, userInfo: ["message": "invalid image data"]))
            }
            self?.state = .isFinished
        })
    }
    
    //5.
    override func main() {
        print("begin download task")
        if (self.isCancelled) {
            print("Task is cancelled before executed")
            state = .isFinished
            return
        }
        
        state = .isExecuting
        self.task.resume()
    }
       
}

let downloadQueue: OperationQueue = {
    let queue = OperationQueue()
    queue.name = "download image queue"
    return queue
}()

let imageUrls = [
                    "https://images.dog.ceo//breeds//schnauzer-miniature//n02097047_1921.jpg",
                    "https://images.dog.ceo//breeds//bluetick//n02088632_403.jpg",
                    "https://images.dog.ceo//breeds//hound-plott//hhh-23456.jpeg",
                    "https://images.dog.ceo//breeds//terrier-patterdale//320px-05078045_Patterdale_Terrier.jpg",
                    "https://images.dog.ceo//breeds//terrier-norfolk//n02094114_1490.jpg",
                    "https://images.dog.ceo//breeds//havanese//00100trPORTRAIT_00100_BURST20191103202017556_COVER.jpg"
                ]

for imageUrl in imageUrls {
    apiServiceDownloadImage(url: imageUrl) { (image, err) in
        if let err = err {
            print("failed to download image with error: ", err)
            return
        }
        DispatchQueue.main.async {
            print("update UI with image size:", image?.size ?? 0)
        }
    }
}

func apiServiceDownloadImage(url: String, completion: @escaping (UIImage?, Error?) -> ()) {
    let operation = DownloadTaskOperation(url: url, completion: completion)
    downloadQueue.addOperation(operation)
}

Timer.scheduledTimer(withTimeInterval:1, repeats: false) { (_) in
    print("cancel")
    downloadQueue.cancelAllOperations()
}

