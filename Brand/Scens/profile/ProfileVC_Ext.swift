//
//  MyProfileController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/13/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension ProfileVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imageViewTapped() {
        editeProfileImage()
    }
    func editeProfileImage() {
        checkPermission()
        let actionSheet = UIAlertController(title: NSLocalizedString( "photo_source", comment: ""), message: NSLocalizedString( "choose_your_photo", comment: ""), preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString( "camera", comment: ""), style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePickerViewController.sourceType = .camera
                self.imagePickerViewController.allowsEditing = true
                self.present(self.imagePickerViewController, animated: true, completion: nil)
            }else{
                print("Camera not avaliable")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString( "photo_library", comment: ""), style: .default, handler: { (action) in
            self.imagePickerViewController.sourceType = .photoLibrary
            self.imagePickerViewController.allowsEditing = true
            self.present(self.imagePickerViewController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString( "cancel", comment: ""), style: .cancel, handler: nil))
        //in completion preform network request
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString( "delete", comment: ""), style: .destructive, handler: { (action) in
            if self.profileView.myprofileImage.image == UIImage(named: "defaultImage"){
                 self.createAlert(title: nil, erroMessage: NSLocalizedString("mustHavePhoto", comment: ""))
            }else{
            APIClient.deleteImage(id: self.photoId ?? 0, complition: { (result) in
                switch result {
                case.success(let msg):
                    self.createAlert(title: nil, erroMessage: msg.message)
                    self.profileView.myprofileImage.image = #imageLiteral(resourceName: "defaultImage")
                    print(msg)
                case.failure(let error):
                    print(error)
                }
              })
            }
         }))
        self.present(actionSheet, animated: true, completion: nil)
    }
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let Info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        if picker.sourceType == .photoLibrary {
            var image : UIImage!
            if let img  =  Info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage
            {
                image = img
                
            }
            else if let img  = Info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
            {
                image = img
            }
            let newImage = resizeImageWith(image: image, newSize: CGSize(width: 150, height: 150))
            let imgData = newImage.jpegData(compressionQuality: 0.2)
            let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL
            print(imageURL as Any)
            profileView.myprofileImage.image = newImage
            picker.dismiss(animated: true) {
                self.uploadRequest(imageData: imgData! , Filename :  imageURL?.absoluteString ?? "")
            }
        }else if picker.sourceType == .camera {
            var image : UIImage!
            if let img  =  Info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage
            {
                image = img
                
            }
            else if let img  = Info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
            {
                image = img
            }
             UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            saveImageDocumentDirectory(image: image)
            let path = getDirectoryPath()
            let newImage = resizeImageWith(image: image, newSize: CGSize(width: 150, height: 150))
            let imgData = newImage.jpegData(compressionQuality: 1.0)
            let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL
            print(imageURL as Any)
            profileView.myprofileImage.image = newImage
            picker.dismiss(animated: true) {
                self.uploadRequest(imageData: imgData! , Filename :  path)
            }
        }
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: NSLocalizedString( "save_error", comment: ""), message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: NSLocalizedString( "ok", comment: ""), style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: NSLocalizedString( "Saved", comment: ""), message: NSLocalizedString( "Your altered image has been saved to your photos", comment: ""), preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default))
            present(ac, animated: true)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
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
    private func uploadRequest(imageData: Data , Filename: String){
        APIClient.uploadImage(imageData: imageData , filename: Filename) { (result) in
            switch result {
            case .success(let data):
                self.createAlert(title: nil, erroMessage: data.message)
                self.photoId = data.photo?.id
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
