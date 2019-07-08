
//  ProductRouter.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/11/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.


import Foundation
import Alamofire

enum ProductRouter:URLRequestConvertible {
    case brands
    case banners
    case categories
    case lastUpdate
    case allReviews
    case updateReview(value:Int,review:String,pros:String,cons:String,objectId:Int,ratingId:Int)
    case getOrders
    case getOrderDetails(orderSerial:String)
    case getCategoryInfo(slug:String)
    case getCategoryProduct(slug:String)
    case getWishlist
    private var Methods : HTTPMethod {
        switch self {
        case .brands,.banners,.categories,.lastUpdate,.allReviews,.getOrders,.getOrderDetails,.getCategoryInfo,.getCategoryProduct,.getWishlist:
            return .get
        case .updateReview:
            return .post
        }
    }
    private var Paths : String {
        switch self {
        case .brands:
            return "/api/brands"
        case .banners:
            return "/api/banners?app"
        case .categories:
            return "/api/categories?markets"
        case .lastUpdate:
            return "/api/last_updates"
        case .allReviews:
            return "/api/ratingables?profile"
        case .updateReview(_,_,_,_,let objectId,let ratingId):
            return "/api/ratingables/catalog/\(objectId)/\(ratingId)"
        case .getOrders:
            return "/api/orders"
        case .getOrderDetails(let orderSerial):
            return "/api/orders/\(orderSerial)"
        case .getCategoryInfo(let slug):
            return "/api/categories/\(slug)"
        case .getCategoryProduct(let slug):
            return "/api/products?category=\(slug)"
        case .getWishlist:
            return "/api/favorite?type=config"
        }
    }
    private var headers : HTTPHeaders {
        switch self {
        case.brands,.banners,.categories,.lastUpdate,.getCategoryInfo,.getCategoryProduct:
            return [
                    HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                    HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
                ]
         case .allReviews,.updateReview,.getOrders,.getOrderDetails,.getWishlist:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        }
    }
    private var parameters :Parameters?{
        switch self {
        case .brands,.banners,.categories,.lastUpdate,.allReviews,.getOrders,.getOrderDetails,.getCategoryInfo,.getCategoryProduct,.getWishlist:
            return [:]
        case .updateReview(let value, let review, let pros, let cons,_,_):
            return [
                    Constants.APIParameterKey.method : RequestMethods.put.rawValue,
                    Constants.APIParameterKey.value: value,
                    Constants.APIParameterKey.review: review,
                    Constants.APIParameterKey.pros: pros,
                    Constants.APIParameterKey.cons: cons
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .banners,.categories,.allReviews,.getCategoryProduct,.getWishlist:
            let url = "\(Constants.ProductionServer.baseURL)\(Paths)"
            let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            var urlRequest = URLRequest(url: URL(string: safeUrl!)!)
            urlRequest.httpMethod = Methods.rawValue
            urlRequest.headers = headers
            if Methods.rawValue == "POST"{
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
        default:
            let url = try Constants.ProductionServer.baseURL
                .asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(Paths))
            urlRequest.httpMethod = Methods.rawValue
            urlRequest.headers = headers
            print(urlRequest)
            if Methods.rawValue == "POST"{
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

