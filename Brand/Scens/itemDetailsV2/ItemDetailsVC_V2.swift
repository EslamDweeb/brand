//
//  ItemDetailsV2.swift
//  Brand
//
//  Created by iOS on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import EasyTipView

class ItemDetailsVC_V2 : UIViewController {
    
    lazy var mainView : ItemDetailsView_V2 = {
        let v = ItemDetailsView_V2(delegate: self , dataSource: self , buttonActionDelegate : self )
        return v
    }()
    
    private var slug = ""
    
    init(slug : String) {
        super.init(nibName: nil , bundle: nil )
        self.slug = slug
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isShowTip = false
    var tipView : EasyTipView?
    var preferences = EasyTipView.Preferences()

    var presenter : ProItemDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        
        presenter = ItemDetailsPresenter(itemView: self  )
        presenter?.getItemDetails(slug: slug)
        
    }
    
    private func openShowTips () {
        preferences.drawing.font = UIFont(name: .fontM, size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = .gray
        EasyTipView.globalPreferences = preferences
        
        if isShowTip == false{
            guard let text = presenter?.sallerNote else{
                return
            }
            tipView = EasyTipView(text: text , preferences: preferences)
            guard let  cell = mainView.collectionViewMain.cellForItem(at: [0,0]) as? CellItemDetailsFirstTab else {
                return
            }
            
            tipView?.show(forView: cell.detailView.buttonInfo , withinSuperview: self.mainView)
            self.isShowTip = !self.isShowTip
        }else{
            tipView?.dismiss()
            self.isShowTip = !self.isShowTip
        }
    }
    
}

extension ItemDetailsVC_V2 : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , DelegateDetailsViewFirstCell , DelegateConfigOptionViewFirstCell {
    
    func selectedConfigOptions(selectedDec: [String : Int] , selectedOptionID : Int ) {
       // print("selectedDec : \(selectedDec)")
        
        presenter?.getConfigSlug(productID: presenter?.itemDetails?.config.productID ?? 0 , values: selectedDec.map({$0.value}) , clickedId:  selectedOptionID )
    }
    
    
    func actionButtonInfo(_ sender: UIButton) {
      //  print("click on info")
        openShowTips()
    }
    
    func actionTapOnTag(tag: Tag) {
       // print("tag : \(tag.name)")
        let s = searchVC()
        s.tagSearch = tag
        self.presentViewController(controller: s , transitionModal:.crossDissolve, presentationStyle: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let config = presenter?.itemDetails?.config
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellItemDetailsFirstTab.getIdentifier() , for: indexPath) as! CellItemDetailsFirstTab
            if presenter?.sallerNote == nil || presenter?.sallerNote == "" {
                cell.detailView.buttonInfo.isHidden = true
            }else {
                cell.detailView.buttonInfo.isHidden = false
            }
            cell.detailView.setData(brandTitle: config?.brand?.name ?? "" , countryTitle: config?.madeIn ?? "" , tags: config?.tags ?? [] )
            cell.detailView.delegate = self // implement DelegateDetailsViewFirstCell
            cell.descriptionView.labelDescriptionData.text = config?.configDescription ?? ""
            cell.configOptionsView.delegateConfigOption = self // implement DelegateConfigOptionViewFirstCell
            cell.configOptionsView.configOptionArray = config?.configOptions ?? []
            cell.getFooterViewData(configs: config?.relatedProducts , simpleConfig: nil )
            cell.footerView.HandelSelectedCellAction = {[weak self] (slug) in
                guard let self = self else{return}
                self.presentViewController(controller: ItemDetailsVC_V2(slug: slug) , transitionModal:.crossDissolve, presentationStyle: nil)
                
            }
            
            return cell
            
        }else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondeCell.getIdentifier() , for: indexPath) as! SecondeCell
            cell.specs = config?.specs ?? []
            cell.tableView.reloadData()
            return cell
        }else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCell.getIdentifier() , for: indexPath) as! ThirdCell
            cell.header.ratingData = presenter?.rateData
            cell.reviews = presenter?.reviews ?? []
            cell.reviewCollectionView.reloadData()
            cell.handelAddReviewButtonTapped = { [weak self] in
                guard let self = self else{return}
                if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != "" {
                    let dest = AddReviewController()
                    dest.catlogId = self.presenter?.itemDetails?.config.catalogID
                    dest.editeFlag = false
                    dest.mainView.setHeaderViewData(self.presenter?.itemDetails?.config.brand?.name ?? "", self.presenter?.itemDetails?.config.name ?? "",5, self.presenter?.itemDetails?.config.mainPhoto?.path)
                    self.present(dest, animated: true, completion: nil)
                }else{
                    self.presentLoginViewController(loginDismiss: true)
                }
            }
            cell.handelPaging = { [weak self] in
                guard let self = self else{return}
              //  self.handelThirdCellPaging?()
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height )
    }
    
}

extension ItemDetailsVC_V2 : ButtonActionDelegate {
    
    func flowButtonTapped(_ sender: UIButton) {
        
    }
    
    func customTabBarTapped(_ sender: UITapGestureRecognizer) {
        
    }
    
}


extension ItemDetailsVC_V2 : ProItemDetailsView {
    func showLoading() {
        self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
    }
    
    func hideLoading() {
        self.mainView.activityStopAnimating()
    }
    
    func onError(_ message: String) {
        hideLoading()
        showMessage(message)
    }
    
    func onFailur(_ message: String) {
        showLoading()
        showMessage(message)
    }
    
    func showMessage(_ message: String) {
        SnackBar.instance.setMessage(message)
    }
    
    func getItemDetails() {
        self.mainView.collectionViewMain.reloadItems(at: [IndexPath(item: 0, section: 0) , IndexPath(item: 1, section: 0)])
    }
    
    func getRatingData () {
        self.mainView.collectionViewMain.reloadItems(at: [IndexPath(item: 2, section: 0)] )
    }
    func getReviewData () {
        self.mainView.collectionViewMain.reloadItems(at: [IndexPath(item: 2, section: 0) ] )
    }

}
