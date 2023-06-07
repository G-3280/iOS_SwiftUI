//
//  ImagePicker.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/06/05.
//

import SwiftUI
import UIKit

//struct ImagePicker: UIViewControllerRepresentable {
//    @Environment(\.presentationMode) var presentationMode
//    @Binding var selectedImage: UIImage?
//
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        @Binding var presentationMode: PresentationMode
//        @Binding var selectedImage: UIImage?
//
//        init(presentationMode: Binding<PresentationMode>, selectedImage: Binding<UIImage?>) {
//            _presentationMode = presentationMode
//            _selectedImage = selectedImage
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let selectedImage = info[.originalImage] as? UIImage {
//                self.selectedImage = selectedImage
//            }
//            $presentationMode.wrappedValue.dismiss()
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            $presentationMode.wrappedValue.dismiss()
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(presentationMode: presentationMode, selectedImage: $selectedImage)
//    }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
//        // Nothing to update
//    }
//}

//struct ImagePicker: UIViewControllerRepresentable {
//    let sourceType: UIImagePickerController.SourceType
//    @Binding var selectedImage: UIImage?
//    @Environment(\.presentationMode) private var presentationMode
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = sourceType
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//
//    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        var parent: ImagePicker
//
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//                parent.selectedImage = Image(uiImage: uiImage)
//            }
//
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
//    }
//}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(selectedImage: $selectedImage)
    }

    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var selectedImage: UIImage?

        init(selectedImage: Binding<UIImage?>) {
            _selectedImage = selectedImage
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            guard let uiImage = info[.originalImage] as? UIImage else {
                return
            }
            selectedImage = uiImage
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            selectedImage = nil
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

