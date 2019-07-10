//
//  CustomImagePicker.swift
//  Brand
//
//  Created by nada dyaa on 7/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import Photos
import UIKit

protocol imageActionDelegate  {
    func deleteImage()
    func uploadImage(imageData: Data , Filename: String , Image : UIImage)
}

class customImagePicker{
    
    var imageAction : imageActionDelegate?
    var imagePicker : UIImagePickerController
    var viewController : UIViewController
    
    init(deleget : imageActionDelegate ,imagePicker : UIImagePickerController , viewController : UIViewController ) {
        imageAction = deleget
        self.imagePicker = imagePicker
        self.viewController = viewController
    }
    
    
    public func openActionSheet() {
        let actionSheet = UIAlertController(title: NSLocalizedString( "photo_source", comment: ""), message: NSLocalizedString( "choose_your_photo", comment: ""), preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString( "camera", comment: ""), style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                
                if(self.checkPermissioncamera() == 1) {
                    self.imagePicker.sourceType = .camera
                    self.imagePicker.allowsEditing = true
                    self.viewController.present(self.imagePicker, animated: true, completion: nil)
                    
                } else if (self.checkPermissioncamera() == 0){
                    AVCaptureDevice.requestAccess(for: .video, completionHandler: { (Bool) in
                        print("status is \(Bool)")
                    })
                    
                } else{
                    self.openSettingDialog()
                }
                
            }else{
                print("Camera not avaliable")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString( "photo_library", comment: ""), style: .default, handler: { (action) in
            
            if (self.checkPhotoLibraryPermission() == 1) {
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.allowsEditing = true
                self.viewController.present(self.imagePicker, animated: true, completion: nil)
                
            } else if (self.checkPhotoLibraryPermission() == 0){
                PHPhotoLibrary.requestAuthorization({
                    (newStatus) in
                    print("status is \(newStatus)")
                })
                
            } else{
                self.openSettingDialog()
            }
        }))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString( "cancel", comment: ""), style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString( "delete", comment: ""), style: .destructive, handler: { (action) in
            self.imageAction?.deleteImage()
        }))
        
        self.viewController.present(actionSheet, animated: true, completion: nil)
    }
    
    
    private func checkPermissioncamera() -> Int {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            return 1
            
        case .denied:
            return 2
            
        case .notDetermined:
            return 0
            
        default:
            return 0
        }
    }
    
    
    private func checkPhotoLibraryPermission() ->Int{
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            return 1
            
        case .denied :
            return 2
            
        case .notDetermined:
            return 0
            
        default:
            return 0
        }
    }
    
    
    
    public  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let Info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        var image : UIImage!
        
        if let img  =  Info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage{
            image = img
        } else if let img  = Info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage{
            image = img
        }
        let newImage = resizeImageWith(image: image, newSize: CGSize(width: 150, height: 150))
        if picker.sourceType == .photoLibrary {
            let imgData = newImage.jpegData(compressionQuality: 0.2)
            let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL
            picker.dismiss(animated: true) {
                self.imageAction?.uploadImage(imageData: imgData!, Filename: imageURL?.absoluteString ?? "", Image: newImage )
            }
        } else if picker.sourceType == .camera {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            saveImageDocumentDirectory(image: image)
            let path = getDirectoryPath()
            let imgData = newImage.jpegData(compressionQuality: 1.0)
            picker.dismiss(animated: true) {
                self.imageAction?.uploadImage(imageData: imgData!, Filename: path, Image: newImage )
            }
        }
    }
    
    
    private func saveImageDocumentDirectory(image: UIImage){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("apple.jpg")
        print(paths)
        let imageData = image.jpegData(compressionQuality: 1.0)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    
    
    private func getDirectoryPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    
    private func openSettingDialog() {
        let alertController = UIAlertController(title: "TITLE", message: "Please go to Settings and turn on the permissions", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })}
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    
    private func resizeImageWith(image: UIImage, newSize: CGSize) -> UIImage {
        let horizontalRatio = newSize.width / image.size.width
        let verticalRatio = newSize.height / image.size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: image.size.width * ratio, height: image.size.height * ratio)
        var newImage: UIImage
        
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = false
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: newSize.width, height: newSize.height), format: renderFormat)
            newImage = renderer.image {
                (context) in
                image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: newSize.width, height: newSize.height), false, 0)
            image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        
        return newImage
    }
    
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        var ac :UIAlertController = UIAlertController()
        
        if let error = error {
            ac = UIAlertController(title: NSLocalizedString( "save_error", comment: ""), message: error.localizedDescription, preferredStyle: .alert)
        } else {
            ac = UIAlertController(title: NSLocalizedString( "Saved", comment: ""), message: NSLocalizedString( "Your altered image has been saved to your photos", comment: ""), preferredStyle: .alert)
        }
        
        ac.addAction(UIAlertAction(title: NSLocalizedString( "ok", comment: ""), style: .default))
        self.viewController.present(ac, animated: true)
    }
    
    private func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
}
