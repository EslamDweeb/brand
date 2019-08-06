//
//  DropDownBtn.swift
//  DropdownList
//
//  Created by Eslam Dweeb on 2/21/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class DropDownBtn: UIButton, dropDwonProtocol {
  
    var index:IndexPath?
    
    var isOpen = false
    var height = NSLayoutConstraint()
    var borderColor:UIColor?
    lazy var  dropView: DropDownView = {
        let v = DropDownView()
        v.delegate = self
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightgray.cgColor
        self.layer.cornerRadius = 5
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(clickat), for: .touchUpInside)
    }
    @objc func clickat(){
        if isOpen == false {
            animateDropDown()
        }else{
            dissmisDropDown()
        }
    }
    override func didMoveToSuperview() {
      super.didMoveToSuperview()
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        if self.superview != nil {
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
        }else{
            return
        }
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if isOpen == false {
//            animateDropDown()
//        }else{
//           dissmisDropDown()
//        }
//    }
    
    func animateDropDown(){
        isOpen = true
        self.layer.borderColor = UIColor.pink.cgColor
        NSLayoutConstraint.deactivate([self.height])
        if self.dropView.tableView.contentSize.height > 150 {
            self.height.constant = 150
        }else{
            self.height.constant = self.dropView.tableView.contentSize.height
        }
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.layoutIfNeeded()
            self.dropView.center.y += self.dropView.frame.height / 2
        }, completion: nil)
    }
    func dissmisDropDown() {
        isOpen = false
        self.layer.borderColor = UIColor.lightgray.cgColor
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.setTitleColor(.black, for: .normal)
        dissmisDropDown()
    }
    func returnIndexPath(indexPath: IndexPath) -> IndexPath {
        index = indexPath
        return index!
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
