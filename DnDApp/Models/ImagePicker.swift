// import SwiftUI
//
// class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    @Binding var isCoordinatorShown: Bool
//    @Binding var imageInCoordinator: Image?
//
//    init(isShown: Binding<Bool>, image: Binding<Image?>) {
//        _isCoordinatorShown = isShown
//        _imageInCoordinator = image
//    }
//    func imagePickerController(_ picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
//        imageInCoordinator = Image(uiImage: unwrapImage)
//        isCoordinatorShown = false
//    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        isCoordinatorShown = false
//    }
// }
//
// struct CaptureImageView {
//    @Binding var isShown: Bool
//    @Binding var image: Image?
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(isShown: $isShown, image: $image)
//    }
// }
//
// extension CaptureImageView: UIViewControllerRepresentable {
//    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        picker.sourceType = .photoLibrary
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController,
//                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
//
//    }
// }

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    var sourceType: UIImagePickerController.SourceType = .photoLibrary

    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
