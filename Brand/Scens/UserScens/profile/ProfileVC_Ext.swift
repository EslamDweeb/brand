//
//  MyProfileController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/13/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension ProfileVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate ,imageActionDelegate{
    func deleteImage() {
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
    
    func uploadImage(imageData: Data, Filename: String, Image: UIImage) {
        profileView.myprofileImage.image  = Image
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
    
    func imageViewTapped() {
        imagepicker?.openActionSheet()
        
    }
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.imagepicker?.imagePickerController(picker, didFinishPickingMediaWithInfo: info)
    }
}
