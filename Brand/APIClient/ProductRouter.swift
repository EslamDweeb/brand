
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
    private var Methods : HTTPMethod {
        switch self {
        case .brands,.banners,.categories,.lastUpdate,.allReviews:
            return .get
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
        }
    }
    private var headers : HTTPHeaders {
        switch self {
        case.brands,.banners,.categories,.lastUpdate:
            return [
                    HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                    HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
                ]
         case .allReviews:
            return [
                HTTPHeaderField.authentication.rawValue : " \(ContentType.token.rawValue) \(UserDefaults.standard.string(forKey: Constants.Defaults.authToken)!)" ,
                HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
                HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
            ]
        }
    }
    private var parameters :Parameters?{
        switch self {
        case .brands,.banners,.categories,.lastUpdate,.allReviews:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .banners,.categories,.allReviews:
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

