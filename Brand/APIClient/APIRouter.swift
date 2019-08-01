
//  APIRouter.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.


import Foundation
import Alamofire
import MOLH
enum APIRouter : URLRequestConvertible {
    case signUp(firstName: String,lastName: String,email: String,phone: String,password: String)
    case login(userName: String,password: String)
    case forgetPassword(email: String)
    case userInfo
    case changePassword(oldPassword: String,newPassword: String)
    case userAddress
    case allCountries
    case addUserAddress(countryID: Int,stateID: Int,city: String,addressName: String?,detailedAddress: String?,personName: String?,postalCode: String?,phone: String?,lat: Double?,lng: Double?)
    case editUserAddress(ID: String, countryID: Int,stateID: Int,city: String,addressName: String?,detailedAddress: String?,personName: String?,postalCode: String?,phone: String?,lat: String?,lng: String?)
    case deleteAddress(Id : String)
    case setdefaultAddress(Id : String)
    case editeInfo(firstName: String?,lastName: String?,email: String?,phone: String?,birthDate: String? ,gender : Int?)
    case uploadImage(imageData: Data,filename : String)
    case deleteImage(id:Int)
    case socialLogin(userSocialId : String)
    case socialSignUp(uerSocialId : String , socialProviderid :Int,firstName: String,lastName: String,email: String,phone: String,password:String)
    case getshippingMethod
      case getbillingMethod
    case checkout(flag: Bool , shippingId : Int , billingId : Int , addressId : Int , coupon : String)
     case deleteCartItem(id:Int)
      case searshItem(name:String)
    private var Methods : HTTPMethod {
        switch self {
        case .signUp:
            return .post
        case .login:
            return .post
        case .forgetPassword:
            return .post
        case .userInfo:
            return .get
        case .changePassword:
            return .post
        case .userAddress:
            return .get
        case .allCountries:
            return .get
        case .addUserAddress:
            return .post
        case .editUserAddress:
            return .post
        case .deleteAddress:
            return .post
        case .setdefaultAddress:
            return .post
        case .uploadImage:
            return .post
        case .deleteImage:
            return .delete
        case .editeInfo:
            return .post
        case .socialSignUp:
            return .post
        case .socialLogin:
            return .post
        case .getshippingMethod:
            return .get
        case .getbillingMethod:
            return .get
        case .checkout:
            return .post
        case .deleteCartItem:
         return   .post
        case .searshItem:
            return .get
        }
    }
    private var Paths : String {
        switch self {
        case .signUp:
            return "/api/signup"
        case .login:
            return "/oauth/token"
        case .forgetPassword:
            return "/api/forgot"
        case .userInfo:
            return "/api/profile/user"
        case .changePassword:
            return "/api/profile/password/change"
        case .userAddress:
            return "/api/profile/addresses"
        case .allCountries:
            return "/api/countries"
        case .addUserAddress:
            return "/api/profile/addresses"
        case .editUserAddress(let ID, _, _,  _, _, _, _, _, _, _, _):
            return "/api/profile/addresses/\(ID)"
            
        case .deleteAddress(let ID):
            return "/api/profile/addresses/\(ID)"
        case .setdefaultAddress(let ID):
            return "/api/toggle/address/\(ID)/main"
        case .uploadImage:
            return "/api/profile/photo"
        case .deleteImage(let id):
            return "/api/media/\(id)"
        case .editeInfo:
            return "/api/profile/user"
        case .socialSignUp:
            return "/api/social-signup"
        case .socialLogin:
            return "/api/social-login"
        case .getshippingMethod:
            return "/api/shipping-methods"
        case .getbillingMethod:
            return "/api/billing-methods"
        case .checkout(let flag,_, _, _, _):
            if flag {
                 return "/api/orders/check"
            }else{
                 return "/api/orders"
            }
           
        case .deleteCartItem(let id):
            return "/api/cart-items/\(id)"
        case .searshItem(let name):
             return "/api/configs?name=\(name)"
        }
    }
    private var headers : HTTPHeaders {
        switch self {
        case .signUp:
            return [
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        case .login:
            return [
                
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        case .forgetPassword:
            return [
                 HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)",
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        case .userInfo:
            return [
                HTTPHeaderField.authentication.rawValue :" \(ContentType.token.rawValue)  \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")",
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.locale.rawValue : MOLHLanguage.currentAppleLanguage()
            ]
        case .changePassword:
            return [
                HTTPHeaderField.authentication.rawValue :" \(ContentType.token.rawValue)  \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")" ,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue
            ]
        case .userAddress:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        case .allCountries:
            return [
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        case .addUserAddress:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue ,
                
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        case .socialLogin:
            return [
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.locale.rawValue : MOLHLanguage.currentAppleLanguage()
            ]
        case .editUserAddress:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue ,
                
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue]
        case .deleteAddress:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue]
        case .setdefaultAddress:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue]
        case .uploadImage:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.form.rawValue
            ]
        case .deleteImage:
            return [
                HTTPHeaderField.authentication.rawValue :"\(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        case .editeInfo:
            return [
                HTTPHeaderField.authentication.rawValue :"\(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        case .socialSignUp:
            return [
                HTTPHeaderField.authentication.rawValue :" \(ContentType.token.rawValue)  \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")",
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.locale.rawValue : MOLHLanguage.currentAppleLanguage()
            ]
        case .getshippingMethod:
            return [
                HTTPHeaderField.authentication.rawValue :" \(ContentType.token.rawValue)  \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")",
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
        
            ]
        case .getbillingMethod:
            return [
                HTTPHeaderField.authentication.rawValue :" \(ContentType.token.rawValue)  \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")",
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                
            ]
        case .checkout:
            return [
                HTTPHeaderField.authentication.rawValue :" \(ContentType.token.rawValue)  \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")",
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue ,
                HTTPHeaderField.contentType.rawValue  : ContentType.json.rawValue ,
                HTTPHeaderField.locale.rawValue : MOLHLanguage.currentAppleLanguage()]
        case .deleteCartItem:
            return [
                HTTPHeaderField.authentication.rawValue :" \(ContentType.token.rawValue)  \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")",
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
              
            ]
        case .searshItem:
            return [ HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue
            ]
            
        }
    }
    private var parameters :Parameters?{
        switch self {
        case .signUp(let firstName,let lastName,let email,let phone,let password):
            return [
                Constants.APIParameterKey.firstName : firstName,
                Constants.APIParameterKey.lastName : lastName,
                
                Constants.APIParameterKey.email:email,
                
                Constants.APIParameterKey.password:password,
                Constants.APIParameterKey.phone:phone
            ]
            
        case .login(let userName,let password):
            return [
                Constants.APIParameterKey.grantType: "password",
                Constants.APIParameterKey.clientID: 2,
                Constants.APIParameterKey.clientSecret:"KNGPHksrLvqRR962gk7qCNmOY960GLQRFEzrRXRv",
                Constants.APIParameterKey.userName: userName,
                Constants.APIParameterKey.password: password
            ]
        case .socialLogin(let usersocialid) :
            return [
                Constants.APIParameterKey.userSocialId : usersocialid
            ]
        case .forgetPassword(let email):
            return [Constants.APIParameterKey.email: email]
        case .userInfo: return [:]
        case .changePassword(let oldPassword,let newPassword):
            return [
                Constants.APIParameterKey.method: "PUT",
                Constants.APIParameterKey.oldPassword: oldPassword,
                Constants.APIParameterKey.newPassword: newPassword,
                Constants.APIParameterKey.local:Constants.Defaults.local
            ]
        case .userAddress: return [:]
        case .allCountries: return [:]
        case .addUserAddress(let countryID,let stateID,let city,let addressName,let detaileAddress,let personName,let postalCode,let phone,let lat, let lng):
            return [
                Constants.APIParameterKey.countryID: countryID,
                Constants.APIParameterKey.stateID: stateID,
                Constants.APIParameterKey.city: city,
                Constants.APIParameterKey.addressName: addressName ?? "",
                Constants.APIParameterKey.detailedAddress: detaileAddress ?? "",
                Constants.APIParameterKey.personName: personName ?? "",
                Constants.APIParameterKey.postalCode: postalCode ?? "",
                Constants.APIParameterKey.phone: phone ?? "",
                Constants.APIParameterKey.lat: lat ?? "",
                Constants.APIParameterKey.lng: lng ?? ""
                
            ]
        case .editUserAddress( _,let countryID,let stateID,let city, let addressName,let detailedAddress,let personName,let postalCode,let phone ,let lat,let lng) :
            return [
                Constants.APIParameterKey.method : RequestMethods.put.rawValue,
                Constants.APIParameterKey.countryID: countryID,
                Constants.APIParameterKey.stateID: stateID,
                Constants.APIParameterKey.city: city,
                Constants.APIParameterKey.addressName: addressName ?? "",
                Constants.APIParameterKey.detailedAddress: detailedAddress ?? "",
                Constants.APIParameterKey.personName: personName ?? "",
                Constants.APIParameterKey.postalCode: postalCode ?? "",
                Constants.APIParameterKey.phone: phone ?? "",
                Constants.APIParameterKey.lat: lat ?? "",
                Constants.APIParameterKey.lng: lng ?? "",
            ]
        case .deleteAddress :
            return [Constants.APIParameterKey.method : RequestMethods.delete.rawValue]
        case .setdefaultAddress:
            return [
                Constants.APIParameterKey.method : RequestMethods.put.rawValue
            ]
        case .uploadImage:
            return [:]
        case .deleteImage:
            return [
                Constants.APIParameterKey.method : RequestMethods.delete.rawValue
            ]
        case .editeInfo(let firstName, let lastName, let email,let phone,let birthDate,let gender ):
            return [
                Constants.APIParameterKey.method: RequestMethods.put.rawValue,
                Constants.APIParameterKey.firstName : firstName ?? "",
                Constants.APIParameterKey.lastName : lastName ?? "",
                Constants.APIParameterKey.birthDate:birthDate ?? "",
                Constants.APIParameterKey.email:email ?? "",
                Constants.APIParameterKey.phone:phone ?? "",
                Constants.APIParameterKey.gender:gender ?? 0,
                Constants.APIParameterKey.local : Constants.Defaults.local
            ]
        case .socialSignUp(let usersocialid , let socialproviderid ,let firstName,let lastName,let email,let phone ,let password ) :
            return [
                Constants.APIParameterKey.userSocialId : usersocialid ,
                Constants.APIParameterKey.socialProviderId : socialproviderid,
                Constants.APIParameterKey.firstName : firstName,
                Constants.APIParameterKey.lastName : lastName,
                Constants.APIParameterKey.email:email,
                Constants.APIParameterKey.phone:phone,
                Constants.APIParameterKey.password : password
            ]
        case .getshippingMethod:
            return [:]
        case .getbillingMethod:
            return [:]
            
        case .checkout(_ ,let shippingId, let billingId, let addressId, let coupon):
            if coupon == "" {
                return [
                    Constants.APIParameterKey.shippingID : shippingId ,
                    Constants.APIParameterKey.billingID : billingId,
                    Constants.APIParameterKey.AddressID : addressId
                    
                ]
            }else {
                return [
                    Constants.APIParameterKey.shippingID : shippingId ,
                    Constants.APIParameterKey.billingID : billingId,
                    Constants.APIParameterKey.AddressID : addressId ,
                    Constants.APIParameterKey.coupon : coupon 
                    
                ]
            }
            
           
        case .deleteCartItem:
            return [Constants.APIParameterKey.method : RequestMethods.delete.rawValue ,
                      HTTPHeaderField.locale.rawValue : MOLHLanguage.currentAppleLanguage()
            
            ]
        case .searshItem:
            return [:]
        }
    }


    func asURLRequest() throws -> URLRequest {
        switch self {
        case .searshItem:
            let url = "\(Constants.ProductionServer.baseURL)\(Paths)"
            let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            var urlRequest = URLRequest(url: URL(string: safeUrl!)!)
            urlRequest.httpMethod = Methods.rawValue
            urlRequest.headers = headers
            if Methods.rawValue != "GET"{
                if let parameters = parameters {
                    do {
                        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    }catch{
                        throw AFError.parameterEncodingFailed(reason:.jsonEncodingFailed(error: error))
                    }
                }
            }
            return urlRequest
        default:
        
        
            let url = try Constants.ProductionServer.baseURL.asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(Paths))
            urlRequest.httpMethod = Methods.rawValue
            urlRequest.headers = headers
            if Methods.rawValue != "GET"{
                if let parameters = parameters {
                    do {
                        print(parameters)
                        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                        print(urlRequest.httpBody!)
                    }catch{
                        throw AFError.parameterEncodingFailed(reason:.jsonEncodingFailed(error: error))
                    }
                }
            }
             return urlRequest
        }
    }
}
