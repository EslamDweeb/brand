//
//  ItemDetailsPresenter.swift
//  Brand
//
//  Created by iOS on 9/11/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

protocol ProItemDetailsView {
    func showLoading()
    func hideLoading()
    func onError(_ message : String )
    func onFailur(_ message : String )
    func showMessage(_ message : String )
    
    func getItemDetails ( )
    func getRatingData ()
    func getReviewData ()
}

protocol ProItemDetailsPresenter {
    
    var sallerNote : String?{ get }
    var itemDetails:ItemDetailInfo? { get }
    var rateData:OverallRating? { get }
    var reviews : [Ratingable] { get }
    func getItemDetails ( slug : String )
    func getRatingData(id:Int)
    func getReviewData(id:Int , refresh:Bool)
    func toggleFav (_ idConfig : Int)
    func getConfigSlug(productID:Int,values:[Int],clickedId:Int)
    
    
    var paginationReview : Int {get set }
    
}

extension ProItemDetailsPresenter {
    func getReviewData(id:Int , refresh:Bool = false ) {
        getReviewData(id: id , refresh: refresh )
    }
}

class ItemDetailsPresenter : ProItemDetailsPresenter {
    
    var itemView : ProItemDetailsView
    var sallerNote : String? = nil
    var itemDetails : ItemDetailInfo? = nil
    var rateData:OverallRating? = nil
    var reviews = [Ratingable]()
    
    var paginationReview : Int = 0
    
    init(itemView : ProItemDetailsView) {
        self.itemView = itemView
    }
    
    func getItemDetails(slug: String) {
       
        APIClient.getItemDetail(slug: slug ) { (result) in
            self.itemView.hideLoading()
            switch result{
            case .success(let data):
                self.itemDetails = data
                self.sallerNote = data.config.sellerNotes
                self.getRatingData(id:Int(data.config.modelRatingID ?? 0))
                self.getReviewData(id:Int(data.config.catalogID ?? 0),refresh:true)
                self.itemView.getItemDetails()
                print(data)
            case .failure(let error):
                //self.mainView.activityStopAnimating()
                self.itemView.onError(error.localizedDescription)
                print(error)
            }
        }
    }
    
    
    func getRatingData(id:Int){
        APIClient.getConfigRating(id: id) { (result) in
            switch result{
            case.success(let data):
                print(data)
                self.rateData = data.overallRating
                self.itemView.getRatingData()
            case.failure(let error):
                //self.mainView.activityStopAnimating()
                self.itemView.onError(YString.errorHappen)
                print(error.localizedDescription)
            }
        }
    }
    
    func getReviewData(id:Int , refresh:Bool ){
        APIClient.getConfigReviews(id: id,page: paginationReview ) { (result) in
            switch result{
            case.success(let data):
                if refresh {
                    self.reviews = data.ratingables
                } else {
                    for conf in data.ratingables {
                        self.reviews.append(conf)
                    }
                }
                self.itemView.getReviewData()
              //  self.shouldShowLoadingCell = (data.meta.currentPage ?? 0) < (data.meta.lastPage ?? 0)
              //  self.mainView.mainCollectionView.reloadData()
              //  self.mainView.activityStopAnimating()
                print(data)
            case.failure(let error):
                print(error)
                self.itemView.onError(YString.errorHappen)
               // self.mainView.activityStopAnimating()
            }
        }
    }
    
    func toggleFav (_ idConfig : Int) {
        
        APIClient.toggleFav(id: idConfig ) { (result) in
            switch result {
            case.success(let data):
                self.itemView.showMessage( data.message ?? "" )
                //self.createAlert(title: nil, erroMessage: data.message ?? "", createButton: nil)
                //self.removeAlertController()
                print(data)
            case .failure(_):
                break
            }
        }
        
    }
    
    func getConfigSlug(productID:Int,values:[Int],clickedId:Int){
        APIClient.getConfigSlug(productID: productID, Values: values, ClickedID: clickedId) { (result) in
            switch result{
            case.success(let data):
                print(data)
                self.getItemDetails(slug: data.configSlug[0] )
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
