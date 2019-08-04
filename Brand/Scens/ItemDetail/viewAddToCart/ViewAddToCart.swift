//
//  ViewAddToCart.swift
//  Brand
//
//  Created by iOS on 8/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ViewAddToCart : UIView {
    
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
    
    lazy var picker : UIPickerView = {
       let p = UIPickerView()
        p.dataSource = self
        p.delegate = self
        return p
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
        labelItemPrice.text = YString.itemPrice + "\n" + "45523"
        labelTotalPrice.text = YString.totalPrice + "\n" + "78465"
        picker.transform = CGAffineTransform(rotationAngle: rotationAngel ?? 0 )
        
    }
    
    lazy var imageMinusCount : UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "nextButton")
        return image
    }()
    
    lazy var imageAddCount : UIImageView = {
       let image = UIImageView ()
        image.image = #imageLiteral(resourceName: "filledHeart")
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
        viewParentScroll.addSubview(imageMinusCount)
        viewParentScroll.addSubview(imageAddCount)
        viewParentScroll.addSubview(labelTotalPrice)
        viewParentScroll.addSubview(buttonAddToCart)
    }
    
    
    private func addConstraint () {
        viewContainer.anchor(top: self.safeAreaLayoutGuide.topAnchor , left: self.leftAnchor , bottom: self.safeAreaLayoutGuide.bottomAnchor , right: self.rightAnchor , centerX: nil , centerY: nil , paddingTop: 16, paddingLeft: 16, paddingBottom: 16 , paddingRight: 16 , width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
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
       imageAddCount.anchor(top: quantity.bottomAnchor , left: nil , bottom: nil  , right: nil  , centerX: nil, centerY: nil, paddingTop: 20 , paddingLeft: 0 , paddingBottom: 0, paddingRight: 32 , width: 25, height: 25 , paddingCenterX: 0, paddingCenterY: 0)
        
        labelTotalPrice.anchor(top: imageAddCount.bottomAnchor , left: self.viewParentScroll.leftAnchor , bottom: nil  , right: self.viewParentScroll.rightAnchor , centerX: nil , centerY: nil , paddingTop: 16 , paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        buttonAddToCart.anchor(top: labelTotalPrice.bottomAnchor , left: viewParentScroll.leftAnchor , bottom: viewParentScroll.bottomAnchor , right: viewParentScroll.rightAnchor , centerX: nil , centerY: nil , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 50 , paddingCenterX: 0, paddingCenterY: 0)
       
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CellAddToCartDropDown.getIdentifier() , for: indexPath) as! CellAddToCartDropDown
        let cell = tableView.dequeueReusableCell(withIdentifier: CellAddToCartButtonView.getIdentifier() , for: indexPath ) as! CellAddToCartButtonView
        cell.setTextLabel(name: "name \(indexPath.row)", price: "345")
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
}

extension ViewAddToCart : UIPickerViewDelegate , UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row : \(row)")
    }
    
    
    
}

