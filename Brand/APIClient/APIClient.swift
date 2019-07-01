//
//  APIClient.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static func SignUp(firstName: String,lastName: String,email: String,phone: String,password: String, complition : @escaping (Result<UserData,Error>) -> Void) {
        AF.request(APIRouter.signUp(firstName: firstName, lastName: lastName, email: email, phone: phone, password: password)).responseDecodable {  (response : DataResponse<UserData>) in
            complition(response.result)
        }
    }
    static func Login(userName: String,password:String,complition: @escaping (Result<LoginData,Error>) -> Void) {
        AF.request(APIRouter.login(userName: userName, password: password)).responseDecodable { (response : DataResponse<LoginData>) in
            complition(response.result)
        }
    }
    static func ForgetPassword(email: String,complition: @escaping (Result<LoginData,Error>) -> Void) {
        AF.request(APIRouter.forgetPassword(email: email)).responseDecodable { (response : DataResponse<LoginData>) in
            complition(response.result)
        }
    }
    static func UserInfo(complition : @escaping (Result<UserData,Error>) -> Void) {
        AF.request(APIRouter.userInfo).responseDecodable {  (response : DataResponse<UserData>) in
            complition(response.result)
        }
    }
    static func ChangePassword(oldPassword: String,newPassword:String,complition: @escaping (Result<LoginData,Error>) -> Void) {
        AF.request(APIRouter.changePassword(oldPassword: oldPassword, newPassword: newPassword)).responseDecodable { (response : DataResponse<LoginData>) in
            complition(response.result)
        }
    }
    //we will change Result&DataResponse<LoginData> to <Data>
    static func UserAddress(complition : @escaping (Result<UserAddresses,Error>) -> Void) {
        AF.request(APIRouter.userAddress).responseDecodable {  (response : DataResponse<UserAddresses>) in
            complition(response.result)
        }
    }
    //we will change Result&DataResponse<LoginData> to <Data>
    static func AllCountries(complition : @escaping (Result<AllCountriesmodel,Error>) -> Void) {
        AF.request(APIRouter.allCountries).responseDecodable {  (response : DataResponse<AllCountriesmodel>) in
            complition(response.result)
        }
    }
    static func addAddress(countryID: Int,stateID: Int,city: String,addressName: String?,detailedAddress: String?,personName: String?,postalCode: String?,phone: String?,lat: Double?,lng: Double?,complition : @escaping (Result<LoginData,Error>) -> Void){
        AF.request(APIRouter.addUserAddress(countryID: countryID, stateID: stateID, city: city, addressName: addressName, detailedAddress: detailedAddress, personName: personName, postalCode: postalCode, phone: phone, lat: lat, lng: lng)).responseDecodable { (response: DataResponse<LoginData>) in
            complition(response.result)
        }
    }
    static func editaddress(Id : String, countryID: Int,stateID: Int,city: String,addressName: String?,detailedAddress: String?,personName: String?,postalCode: String?,phone: String?,lat: String?,lng: String?,complition : @escaping (Result<LoginData,Error>) -> Void){
        AF.request(APIRouter.editUserAddress(ID: Id, countryID: countryID, stateID: stateID, city: city, addressName: addressName, detailedAddress: detailedAddress, personName: personName, postalCode: postalCode, phone: phone, lat: lat, lng: lng)).responseDecodable { (response : DataResponse<LoginData>) in
            complition(response.result)
        }
        
    }
    static func Deleteaddress(Id : String,complition : @escaping (Result<LoginData,Error>) -> Void){
        AF.request(APIRouter.deleteAddress(Id: Id)).responseDecodable { (response : DataResponse<LoginData>) in
            complition(response.result)
        }
        
    }
    static func Setdefaultaddress(Id : String,complition : @escaping (Result<LoginData,Error>) -> Void){
        AF.request(APIRouter.setdefaultAddress(Id: Id)).responseDecodable { (response : DataResponse<LoginData>) in
            complition(response.result)
        }
        
    }
    static func uploadImage(imageData:Data,filename : String , complition : @escaping (Result<UploadPhotoInfo,Error>) -> Void) {
        let parameters = ["_method": "PUT","locale":"en"]
        let multiPart = MultipartFormData()
        multiPart.append(imageData, withName: "photo", fileName: filename, mimeType: "image/jpg")
        for (key, value) in parameters {
            multiPart.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        print(multiPart)
        AF.upload(multipartFormData: multiPart, with: APIRouter.uploadImage(imageData: imageData , filename : filename)).responseDecodable { (response: DataResponse<UploadPhotoInfo>) in
              complition(response.result)
        }
    }
    static func editeUserInfo(firstName: String,lastName: String,email: String,phone: String,birthDate: String,gender : Int ,complition : @escaping (Result<UserData,Error>) -> Void){
        AF.request(APIRouter.editeInfo(firstName: firstName, lastName: lastName, email: email, phone: phone, birthDate: birthDate, gender: gender)).responseDecodable {  (response : DataResponse<UserData>) in
            complition(response.result)
        }
    }
    
    static func deleteImage(id:Int,complition : @escaping (Result<UploadPhotoInfo,Error>) -> Void){
        AF.request(APIRouter.deleteImage(id:id)).responseDecodable{(response: DataResponse<UploadPhotoInfo>) in
            complition(response.result)
        }
    }
    static func getBrands(complition : @escaping (Result<BrandData,Error>) -> Void) {
        AF.request(ProductRouter.brands).responseDecodable {  (response : DataResponse<BrandData>) in
            complition(response.result)
        }
    }
    static func getBanners(complition : @escaping (Result<BannersData,Error>) -> Void) {
        AF.request(ProductRouter.banners  ).responseDecodable {  (response : DataResponse<BannersData>) in
          
            complition(response.result)
        }
    }
    static func getCategory(complition : @escaping (Result<CategoriesData,Error>) -> Void) {
        AF.request(ProductRouter.categories  ).responseDecodable{(response:DataResponse<CategoriesData>) in
            complition(response.result)
        }
    }
    static func lastUpdates(complition : @escaping (Result<LastUpdate,Error>) -> Void) {
        AF.request(ProductRouter.lastUpdate).responseDecodable{(response:DataResponse<LastUpdate>) in
            complition(response.result)
        }
    }
}