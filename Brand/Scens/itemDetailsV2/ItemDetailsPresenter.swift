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
    func getReviewData()
    func toggleFav (_ idConfig : Int)
    func getConfigSlug(productID:Int,values:[Int],clickedId:Int)
    
}

class ItemDetailsPresenter : ProItemDetailsPresenter {
    

    var itemView : ProItemDetailsView
    var sallerNote : String? = nil
    var itemDetails : ItemDetailInfo? = nil
    var rateData:OverallRating? = nil
    var reviews = [Ratingable]()
    
    
    var idGetReviews : Int = 0
    // pageination reviews
    var currentPage: Int = 0
    var lastPage: Int = 1
    var paginate: Bool = false
    
    
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
                self.idGetReviews = Int(data.config.catalogID ?? 0)
                self.getReviewData()
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
    
    func getReviewData(){
        
        if currentPage >= lastPage {
            return
        }
        if paginate {
            return
        }
        self.paginate = true
        currentPage += 1
        
        APIClient.getConfigReviews(id: idGetReviews , page: currentPage ) { (result) in
            switch result{
            case.success(let data):
                self.reviews += data.ratingables
                self.currentPage = data.meta.currentPage ?? 1
                self.lastPage = data.meta.lastPage ?? 1
                self.paginate = false
                self.itemView.getReviewData()
                print(data)
            case.failure(let error):
                print(error)
                self.itemView.onError(YString.errorHappen)
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
