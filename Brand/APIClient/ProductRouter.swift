
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
    case allReviews(pageNumber:Int)
    case addReview(id:Int,value:Int,review:String,pros:String,cons:String)
    case updateReview(value:Int,review:String,pros:String,cons:String,objectId:Int,ratingId:Int)
    case getOrders(pageNumber:Int)
    case getOrderDetails(orderSerial:String)
    case getCategoryInfo(slug:String)
    case getCategoryProduct(slug:String)
    case getWishlist(pageNumber:Int)
    case getCartData(pageNumber:Int)
    case getExploreData
    case getFlashData
    case getFlashHeader
    case getAllProductConfigs(slug:String,pageNumber:Int)
    case toggleFav(id:Int)
    case getitemDetail(slug:String)
    case getConfigReview(id:Int,pageNumber:Int)
    case getConfigRating(id:Int)
    case getSeeAllProduct(key:String,pageNumber:Int)
    private var Methods : HTTPMethod {
        switch self {
        case .brands,.banners,.categories,.lastUpdate,.allReviews,.getOrders,.getOrderDetails,.getCategoryInfo,.getCategoryProduct,.getWishlist,.getCartData,.getExploreData,.getFlashData,.getAllProductConfigs,.getitemDetail,.getConfigReview,.getConfigRating,.getSeeAllProduct,.getFlashHeader:
            return .get
        case .updateReview,.toggleFav,.addReview:
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
        case .allReviews(let pageNumber):
            return "/api/ratingables?profile&page=\(pageNumber)"
        case .addReview(let id,_,_,_,_):
            return "/api/ratingables/catalog/\(id)"
        case .updateReview(_,_,_,_,let objectId,let ratingId):
            return "/api/ratingables/catalog/\(objectId)/\(ratingId)"
        case .getOrders(let pageNumber):
            return "/api/orders&page=\(pageNumber)"
        case .getOrderDetails(let orderSerial):
            return "/api/orders/\(orderSerial)"
        case .getCategoryInfo(let slug):
            return "/api/categories/\(slug)"
        case .getCategoryProduct(let slug):
            return "/api/products?category=\(slug)"
        case .getWishlist(let pageNumber):
            return "/api/favorite?type=config&page=\(pageNumber)"
        case .getCartData(let pageNumber):
            return "/api/cart-items&page=\(pageNumber)"
        case .getExploreData:
            return "/api/explore"
        case .getFlashData:
            return "/api/flash"
        case .getAllProductConfigs(let slug,let pageNumber):
            return "/api/configs?brands=\(slug)&page=\(pageNumber)"
        case .toggleFav(let id):
            return "/api/favorite/configs/\(id)"
        case .getitemDetail(let slug):
            return "/api/configs/\(slug)"
        case .getConfigReview(let id,let pageNumber):
            return "/api/ratingables?type=catalog&id=\(id)&page=\(pageNumber)"
        case .getConfigRating(let id):
            return "/api/model-ratings/\(id)"
        case .getSeeAllProduct(let key,let pageNumber):
            return "/api/configs?show=\(key)&page=\(pageNumber)"
        case .getFlashHeader:
            return "/api/settings?type=flash_offer_header"
        }
    }
    private var headers : HTTPHeaders {
        switch self {
        case.brands,.banners,.categories,.lastUpdate,.getCategoryInfo,.getCategoryProduct,.getFlashData,.getAllProductConfigs,.getFlashHeader:
            return [
                    HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                    HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
                ]
         case .allReviews,.updateReview,.getOrders,.getOrderDetails,.getWishlist,.getCartData,.toggleFav,.getExploreData,.getitemDetail,.getConfigReview,.getConfigRating,.addReview,.getSeeAllProduct:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken) ?? "")" ,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        }
    }
    private var parameters :Parameters?{
        switch self {
        case .brands,.banners,.categories,.lastUpdate,.allReviews,.getOrders,.getOrderDetails,.getCategoryInfo,.getCategoryProduct,.getWishlist,.getCartData,.getExploreData,.getFlashData,.getAllProductConfigs,.getitemDetail,.getConfigReview,.getConfigRating,.getSeeAllProduct,.getFlashHeader:
            return [:]
        case .updateReview(let value, let review, let pros, let cons,_,_):
            return [
                    Constants.APIParameterKey.method : RequestMethods.put.rawValue,
                    Constants.APIParameterKey.value: value,
                    Constants.APIParameterKey.review: review,
                    Constants.APIParameterKey.pros: pros,
                    Constants.APIParameterKey.cons: cons
            ]
        case .addReview(_,let value, let review, let pros, let cons):
            return [
                Constants.APIParameterKey.value: value,
                Constants.APIParameterKey.review: review,
                Constants.APIParameterKey.pros: pros,
                Constants.APIParameterKey.cons: cons
            ]
        case .toggleFav:
            return  [Constants.APIParameterKey.method : RequestMethods.put.rawValue]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .banners,.categories,.allReviews,.getCategoryProduct,.getWishlist,.getAllProductConfigs,.getConfigReview
            ,.getSeeAllProduct,.getCartData,.getFlashHeader:
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

