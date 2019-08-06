//
//  ViewAddToCart.swift
//  Brand
//
//  Created by iOS on 8/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import AKPickerView


class ViewAddToCart : UIView {
    
    var presenter : ProAddToCartPresenter?
    
    lazy var scrollView : UIScrollView = {
       let s = UIScrollView()
        s.layer.cornerRadius = 25
        s.backgroundColor = .white
        return s
    }()
    
    lazy var viewContainer : UIView = {
        let view = UIView() 
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(doNothing )))
        view.layer.cornerRadius = 25
        view.backgroundColor = .white
        return view
    }()
    
    lazy var viewParentScroll : UIView = {
       let v = UIView()
        return v
    }()
    
    lazy var closeButton : UIButton = {
       let b = UIButton()
        b.setImage(#imageLiteral(resourceName: "crossAnticon"), for: .normal )
        b.addTarget(self , action: #selector(dismiss ), for: .touchUpInside)
        return b
    }()
    
    lazy var labelProductOption : UILabel = {
       let l = UILabel ()
        l.font = setFont(name: .fontH , size: 16 )
        
        l.text = YString.productOptions
       return l
    }()
    
    lazy var tableView : UITableView = {
       let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.register(CellAddToCartDropDown.self , forCellReuseIdentifier: CellAddToCartDropDown.getIdentifier())
        t.register(CellAddToCartButtonView.self , forCellReuseIdentifier: CellAddToCartButtonView.getIdentifier())
        t.tableFooterView = UIView()
        t.separatorStyle = UITableViewCell.SeparatorStyle.none
        return t
    }()
    var heightTableView : NSLayoutConstraint?
    
    lazy var labelItemPrice : UILabel = {
        let l = UILabel ()
        l.font = setFont(name: .fontH , size: 16 )
        l.text = YString.itemPrice
        l.numberOfLines = 0
        l.lineBreakMode = NSLineBreakMode.byWordWrapping
        l.textAlignment = .center
        return l
    }()
    
    lazy var quantity : UILabel = {
        let l = UILabel()
        l.font = setFont(name: .fontH , size: 16 )
        l.text = YString.quantity
        l.textAlignment = .center
        return l
    }()
    

    var rotationAngel : CGFloat?
    
    lazy var labelTotalPrice : UILabel = {
        let l = UILabel()
        l.font = setFont(name: .fontH , size: 16 )
        l.text = YString.totalPrice
        l.numberOfLines = 0
        l.lineBreakMode = NSLineBreakMode.byWordWrapping
        l.textAlignment = .center
        return l
    }()
    
    lazy var buttonAddToCart : UIButton = {
        let b = UIButton()
        b.setTitle(YString.addToCart , for: .normal )
        b.addTarget(self , action: #selector( addToCartAction ), for: .touchUpInside )
        b.backgroundColor = .pink
        return b
    }()
    
    
    lazy var pickerView : AKPickerView = {
       let p = AKPickerView()
        p.layer.borderWidth = 1
        p.layer.borderColor = UIColor.blackTransparent.cgColor
        p.layer.cornerRadius = 5
        p.delegate = self
        p.dataSource = self
        return p
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    private func initViews () {
        self.backgroundColor = .blackTransparent
        rotationAngel = 90*(.pi/180)
//        self.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(dismiss)))
        
        addView()
        addConstraint()
        
        labelTotalPrice.text = YString.totalPrice + "\n" + "78465"
        
    }
    
    lazy var imageMinusCount : UIButton = {
       let image = UIButton()
        image.setImage(#imageLiteral(resourceName: "minus"), for: .normal)
        image.backgroundColor = .white
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor.pink.cgColor
        image.layer.cornerRadius = 5
        
        return image
    }()
    
    lazy var imageAddCount : UIButton = {
        let image = UIButton()
        image.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        image.backgroundColor = .pink
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor.pink.cgColor
        image.layer.cornerRadius = 5
        return image
    }()
    
    
    private func addView () {
        
        self.addSubview(viewContainer)
        viewContainer.addSubview(closeButton)
        viewContainer.addSubview(labelProductOption)
        viewContainer.addSubview(scrollView)
        scrollView.addSubview(viewParentScroll)
        viewParentScroll.addSubview(tableView)
        viewParentScroll.addSubview(labelItemPrice)
        viewParentScroll.addSubview(quantity)
        viewParentScroll.addSubview( pickerView )
        viewParentScroll.addSubview(imageMinusCount)
        viewParentScroll.addSubview(imageAddCount)
        viewParentScroll.addSubview(labelTotalPrice)
        viewParentScroll.addSubview(buttonAddToCart)
        
    }
    
    private func addConstraint () {
//        viewContainer.anchor(top: self.safeAreaLayoutGuide.topAnchor , left: self.leftAnchor , bottom: self.safeAreaLayoutGuide.bottomAnchor , right: self.rightAnchor , centerX: nil , centerY: nil , paddingTop: 16, paddingLeft: 16, paddingBottom: 16 , paddingRight: 16 , width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.topAnchor.constraint(greaterThanOrEqualTo : self.safeAreaLayoutGuide.topAnchor , constant: 16) .isActive = true
        viewContainer.leftAnchor.constraint(equalTo: self.leftAnchor , constant: 16 ).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: self.rightAnchor , constant: -16 ).isActive = true
        viewContainer.bottomAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor , constant: 16 ).isActive = true
        viewContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor , constant: 0).isActive = true
        viewContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor , constant: 0 ).isActive = true
        
        
        closeButton.anchor(top: viewContainer.topAnchor , left: viewContainer.leftAnchor , bottom: nil, right: nil, centerX: nil , centerY: nil , paddingTop: 16, paddingLeft: 16 , paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        labelProductOption.anchor(top: viewContainer.topAnchor  , left: nil, bottom: nil , right: nil , centerX: viewContainer.centerXAnchor , centerY: nil , paddingTop: 16 , paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        scrollView.anchor(top: labelProductOption.bottomAnchor , left: viewContainer.leftAnchor , bottom: viewContainer.bottomAnchor, right: viewContainer.rightAnchor , centerX: nil , centerY: nil , paddingTop: 16 , paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        viewParentScroll.anchor(top: scrollView.topAnchor , left: scrollView.leftAnchor , bottom: scrollView.bottomAnchor , right: scrollView.rightAnchor , centerX: nil, centerY: nil , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        viewParentScroll.widthAnchor.constraint(equalTo: scrollView.widthAnchor , multiplier: 1 ).isActive = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.viewParentScroll.topAnchor , constant: 16 ).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.viewParentScroll.leftAnchor , constant: 16 ).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.viewParentScroll.rightAnchor , constant: -16 ).isActive = true
        heightTableView = tableView.heightAnchor.constraint(equalToConstant: 50 )
        heightTableView?.isActive = true
        
        labelItemPrice.anchor(top: self.tableView.bottomAnchor , left: self.viewParentScroll.leftAnchor , bottom: nil , right: self.viewParentScroll.rightAnchor , centerX: self.viewParentScroll.centerXAnchor , centerY: nil , paddingTop: 0, paddingLeft: 0, paddingBottom: 16 , paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)

        quantity.anchor(top: self.labelItemPrice.bottomAnchor , left: self.viewParentScroll.leftAnchor , bottom: nil , right: self.viewParentScroll.rightAnchor , centerX: nil , centerY: nil , paddingTop: 16 , paddingLeft: 16, paddingBottom: 16, paddingRight: 16 , width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
       imageMinusCount.anchor(top: quantity.bottomAnchor , left: self.viewParentScroll.leftAnchor , bottom: nil , right: nil , centerX: nil, centerY: nil, paddingTop: 20 , paddingLeft: 32 , paddingBottom: 0, paddingRight: 0, width: 25, height: 25 , paddingCenterX: 0, paddingCenterY: 0)
        
       imageAddCount.anchor(top: quantity.bottomAnchor , left: nil , bottom: nil  , right: self.viewParentScroll.rightAnchor  , centerX: nil, centerY: nil, paddingTop: 20 , paddingLeft: 0 , paddingBottom: 0, paddingRight: 32 , width: 25, height: 25 , paddingCenterX: 0, paddingCenterY: 0)
        
        pickerView.anchor(top: nil , left: imageMinusCount.rightAnchor , bottom: nil , right: imageAddCount.leftAnchor , centerX: nil , centerY: imageAddCount.centerYAnchor , paddingTop: 0 , paddingLeft: 16, paddingBottom: 0  , paddingRight: 16, width: 0, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        
        labelTotalPrice.anchor(top: imageAddCount.bottomAnchor , left: self.viewParentScroll.leftAnchor , bottom: nil  , right: self.viewParentScroll.rightAnchor , centerX: nil , centerY: nil , paddingTop: 16 , paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        buttonAddToCart.anchor(top: labelTotalPrice.bottomAnchor , left: viewParentScroll.leftAnchor , bottom: viewParentScroll.bottomAnchor , right: viewParentScroll.rightAnchor , centerX: nil , centerY: nil , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 50 , paddingCenterX: 0, paddingCenterY: 0)
       
    }
    
    func setPrice () {
        labelItemPrice.text = YString.itemPrice + "\n" + "\( self.presenter?.priceProduct ?? 0 )"
    }
    
    @objc private func addToCartAction () {
        
    }
    
    @objc private func doNothing (){
        print("doNothing")
    }
    
    @objc private func dismiss () {
        self.removeFromSuperview()
    }
    
}

extension ViewAddToCart : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        heightTableView?.constant = self.tableView.contentSize.height + 20 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.productOptions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleObjc = presenter?.productOptions[indexPath.row]
        if singleObjc?.values?.count ?? 0 > 0 {
              let cell = tableView.dequeueReusableCell(withIdentifier: CellAddToCartDropDown.getIdentifier() , for: indexPath) as! CellAddToCartDropDown
            cell.setupCell(values: singleObjc?.values ?? [] , parentID: singleObjc?.id ?? 0 )
            cell.completion = { [weak self ] ( value , parentID )  in
                if let index = self?.presenter?.selectedValues.firstIndex(where: { $0.parentID == parentID }) {
                    self?.presenter?.selectedValues[index].value = value
                }else {
                    self?.presenter?.selectedValues.append( (parentID : parentID , value : value) )
                }

            }
            return  cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellAddToCartButtonView.getIdentifier() , for: indexPath ) as! CellAddToCartButtonView
            cell.setTextLabel(name: singleObjc?.name ?? ""  , price: singleObjc?.addsPrice ?? 0)
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CellAddToCartButtonView {
            let singleObjc = presenter?.productOptions[indexPath.row]
            
            if let index = self.presenter?.selectedProductOption.firstIndex(where: { $0.id == singleObjc?.id }) {
                self.presenter?.selectedProductOption.remove(at: index)
            }else {
                self.presenter?.selectedProductOption.append( singleObjc! )
            }
            
            if cell.isCellSelected {
                cell.deSelectItem()
            }else {
                cell.selectItem()
            }

        }
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
}

extension ViewAddToCart : AKPickerViewDelegate , AKPickerViewDataSource {
    
    func numberOfItems(in pickerView: AKPickerView!) -> UInt {
            return 120
    }
    
    func pickerView(_ pickerView: AKPickerView!, titleForItem item: Int) -> String! {
        return "   \( item + 1 )   "
    }
    
    func pickerView(_ pickerView: AKPickerView!, didSelectItem item: Int) {
        print("\( item + 1)")
    }
    
}

