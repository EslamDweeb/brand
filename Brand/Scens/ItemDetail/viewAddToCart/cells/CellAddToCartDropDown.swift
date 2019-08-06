//
//  CellAddToCartDropDown.swift
//  Brand
//
//  Created by iOS on 8/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class CellAddToCartDropDown : UITableViewCell {
    
    lazy var textField : UITextField = {
        let t = UITextField()
        t.textAlignment = .center
        t.layer.cornerRadius = 5
        t.layer.borderColor = UIColor.blackTransparent.cgColor
        t.layer.borderWidth = 0.5
        t.placeholder = YString.selectOption
        return t
    }()
    
    private var values : [ProductOptionValues] = []
    private var parentID : Int = 0
    var selectedValue : ProductOptionValues? = nil
    
    var completion : ((_ value : ProductOptionValues , _ parentID : Int ) -> Void)?
    
    let pickerView = UIPickerView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier )
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews () {
        addToolBar()
        self.selectionStyle = .none
        self.contentView.addSubview(textField)
        textField.anchor(top: self.contentView.topAnchor , left: self.contentView.leftAnchor , bottom: self.contentView.bottomAnchor , right: self.contentView.rightAnchor , centerX: nil , centerY: nil , paddingTop: 4, paddingLeft: 0, paddingBottom: 4 , paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
    
    
    private func addToolBar () {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .gray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: YString.done , style: UIBarButtonItem.Style.plain , target: self, action: #selector(donePicker))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        textField.inputView = pickerView
        textField.inputAccessoryView = toolBar
    }
    
    
    func setupCell (values : [ProductOptionValues], parentID : Int ) {
        self.values = values
        self.parentID = parentID
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.reloadAllComponents()
    }
    
    @objc private func donePicker () {
        if selectedValue == nil , values.count > 0 {
            selectedValue = values[0]
            textField.text = selectedValue?.value
            completion?(selectedValue! , parentID )
        }
        self.endEditing(true)
    }
    
}

extension CellAddToCartDropDown : UIPickerViewDelegate , UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row].value
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValue = values[row]
        textField.text = selectedValue?.value
        completion?(selectedValue! , parentID )
        print ("value : \(values[row].value )")
    }
    
}
