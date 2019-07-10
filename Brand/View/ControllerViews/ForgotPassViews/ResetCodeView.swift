//
//  ResetCodeView.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/28/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ResetCodeView: UIView {
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        navView.titlelabel.text = "reset_password".localized
        return navView
    }()
    
    
    lazy var lable:HeaderLabel = {
        let lable = HeaderLabel()
        lable.text = "we_will_send_you_a_short_code_to_reet_your_password".localized
        return lable
    }()
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "iconsFinalPasswordSent")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    lazy var textField1: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.textAlignment = .center
        return text
    }()
    lazy var textField2: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.textAlignment = .center
        return text
    }()
    lazy var textField3: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.textAlignment = .center
        return text
    }()
    lazy var textField4: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.textAlignment = .center
        return text
    }()
    lazy var textField5: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.textAlignment = .center
        return text
    }()
    lazy var textField6: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.textAlignment = .center
        return text
    }()
    lazy var lineView1: lineView = {
        let view = lineView()
        return view
    }()
    lazy var lineView2: lineView = {
        let view = lineView()
        return view
    }()
    lazy var lineView3: lineView = {
        let view = lineView()
        return view
    }()
    lazy var lineView4: lineView = {
        let view = lineView()
        return view
    }()
    lazy var lineView5: lineView = {
        let view = lineView()
        return view
    }()
    lazy var lineView6: lineView = {
        let view = lineView()
        return view
    }()
    lazy var continueBtn: GradBtn = {
        let button = GradBtn(enabledd: false)
        button.setTitle("CONTINUE".localized, for: .normal)
        return button
    }()
    lazy var lable2:DefaultLabel = {
        let lable = DefaultLabel()
        lable.text = "didn_t_receive_a_code".localized
        return lable
    }()
    lazy var requestCodeBtn: UIButton = {
        let button = UIButton()
        button.setTitle("request_new_one".localized, for: .normal)
        button.setTitleColor( .pink, for: .normal)
        button.titleLabel?.font = setFont(name: .fontH, size: 16)
        return button
    }()
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
    }()
    lazy var stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.axis = .horizontal
        return stackView
    }()
    lazy var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.axis = .horizontal
        return stackView
    }()
    lazy var stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .horizontal
        return stackView
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    public weak var actionDelegate: ButtonActionDelegate?
    //MARK:- View Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    func setupView() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        self.addSubview(navView)
       
      
        scrollView.addSubview(logoImage)
        scrollView.addSubview(lable)
        scrollView.addSubview(stackView1)
        scrollView.addSubview(stackView2)
        scrollView.addSubview(stackView3)
        scrollView.addSubview(containerStackView)
        scrollView.addSubview(continueBtn)
        stackView1.addArrangedSubview(textField1)
        stackView1.addArrangedSubview(textField2)
        stackView1.addArrangedSubview(textField3)
        stackView1.addArrangedSubview(textField4)
        stackView1.addArrangedSubview(textField5)
        stackView1.addArrangedSubview(textField6)
        stackView2.addArrangedSubview(lineView1)
        stackView2.addArrangedSubview(lineView2)
        stackView2.addArrangedSubview(lineView3)
        stackView2.addArrangedSubview(lineView4)
        stackView2.addArrangedSubview(lineView5)
        stackView2.addArrangedSubview(lineView6)
        stackView3.addArrangedSubview(lable2)
        stackView3.addArrangedSubview(requestCodeBtn)
        containerStackView.addArrangedSubview(stackView1)
        containerStackView.addArrangedSubview(stackView2)
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.anchor(top:topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12).isActive = true
        textField1.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        textField2.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        textField3.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        textField4.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        textField5.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        textField6.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 30, paddingCenterX: 0, paddingCenterY: 0)
           lineView1.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 2, paddingCenterX: 0, paddingCenterY: 0)
          lineView2.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 2, paddingCenterX: 0, paddingCenterY: 0)
          lineView3.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 2, paddingCenterX: 0, paddingCenterY: 0)
          lineView4.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 2, paddingCenterX: 0, paddingCenterY: 0)
          lineView5.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 2, paddingCenterX: 0, paddingCenterY: 0)
          lineView6.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 2, paddingCenterX: 0, paddingCenterY: 0)
        lable2.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
       requestCodeBtn.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        logoImage.anchor(top: scrollView.topAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 30, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 200, height: 200, paddingCenterX: 0, paddingCenterY: 0)
        lable.anchor(top: logoImage.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 220, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        containerStackView.anchor(top: lable.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        continueBtn.anchor(top: containerStackView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 40, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        stackView3.anchor(top: continueBtn.bottomAnchor, left:  nil, bottom: scrollView.bottomAnchor, right: nil, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        //Add Target
       navView.backBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        continueBtn.addTarget(self.actionDelegate, action: #selector(ButtonActionDelegate.continuePressed), for: .touchUpInside)
    }
}
