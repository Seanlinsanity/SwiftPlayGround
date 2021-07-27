import UIKit

var str = "Hello, playground"

extension UIImagePickerController {
    static func `default`() -> UIImagePickerController {
        let imgPickerController = UIImagePickerController()
        imgPickerController.isEditing = false
        imgPickerController.sourceType = .savedPhotosAlbum
        return imgPickerController
    }
}

print(UIImagePickerController.default())
print(UIImagePickerController.default())
