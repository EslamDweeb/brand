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
    
    func selectDefault () {
        if self.values.count > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.selectedValue = self.values[0]
                self.textField.text = (self.values[0].value ?? "" ) + " ( +\(self.values[0].addsPrice) SAR ) "
                self.completion?(self.selectedValue! , self.parentID )
            }
        }
    }
    
    @objc private func donePicker () {
        if selectedValue == nil , values.count > 0 {
            if values[0].id == -1 {
                selectedValue = values[0]
                textField.text = ""
                textField.placeholder = YString.selectOption
                completion?(selectedValue! , parentID )
                return
            }
            
            selectedValue = values[0]
            textField.text = (selectedValue?.value ?? "" ) + " ( +\(selectedValue?.addsPrice ?? 0 ) SAR ) "
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
        if values[row].id == -1 {
            return (values[row].value ?? "" )
        }
        return (values[row].value ?? "" ) + " ( +\(values[row].addsPrice) SAR ) "
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if values[row].id == -1 {
            selectedValue = values[row]
            textField.text = ""
            textField.placeholder = YString.selectOption
            completion?(selectedValue! , parentID )
            return
        }
        selectedValue = values[row]
        textField.text = (values[row].value ?? "" ) + " ( +\(values[row].addsPrice) SAR ) "
        completion?(selectedValue! , parentID )
        print ("value : \(values[row].value )")
    }
    
}
