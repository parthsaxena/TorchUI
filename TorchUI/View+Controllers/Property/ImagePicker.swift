//
//  ImagePicker.swift
//  TorchUI
//
//  Created by Saeed on 17/12/2023.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: UIImage?
    @Binding var didSelectCustomImage: Bool
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, didSelectCustomImage: $didSelectCustomImage, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: UIImage?
    @Binding var didSelectCustomImage: Bool
    @Binding var isPresented: Bool
    
    init(image: Binding<UIImage?>, didSelectCustomImage: Binding<Bool>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
        self._didSelectCustomImage = didSelectCustomImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = image
            self.didSelectCustomImage = true
        }
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}
