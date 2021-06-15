//
//  ResetCodeViewController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/29/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension ResetCodeViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
          textField.textColor = .pink
                if textField == resetView.textField1  {
                    self.resetView.lineView1.backgroundColor = .lightgray
                }else if textField == resetView.textField2  {
                    self.resetView.lineView2.backgroundColor = .lightgray
                }else if textField == resetView.textField3  {
                    self.resetView.lineView3.backgroundColor = .lightgray
                }else if textField == resetView.textField4 {
                    self.resetView.lineView4.backgroundColor = .lightgray
                }else if textField == resetView.textField5 {
                    self.resetView.lineView5.backgroundColor = .lightgray
                }else if textField == resetView.textField6 {
                    self.resetView.lineView6.backgroundColor = .lightgray
                }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == resetView.textField1 && textField.text != "" {
            self.resetView.lineView1.backgroundColor = .pink
        }else if textField == resetView.textField2 && textField.text != ""{
            self.resetView.lineView2.backgroundColor = .pink
        }else if textField == resetView.textField3 && textField.text != ""{
            self.resetView.lineView3.backgroundColor = .pink
        }else if textField == resetView.textField4 && textField.text != ""{
            self.resetView.lineView4.backgroundColor = .pink
        }else if textField == resetView.textField5 && textField.text != ""{
            self.resetView.lineView5.backgroundColor = .pink
        }else if textField == resetView.textField6 && textField.text != ""{
            self.resetView.lineView6.backgroundColor = .pink
        }
        if self.resetView.lineView1.backgroundColor == .pink &&
            self.resetView.lineView2.backgroundColor == .pink &&
            self.resetView.lineView3.backgroundColor == .pink &&
            self.resetView.lineView4.backgroundColor == .pink &&
            self.resetView.lineView5.backgroundColor == .pink &&
            self.resetView.lineView6.backgroundColor == .pink {
            resetView.continueBtn.isEnabled = true
           resetView.continueBtn.backgroundColor = .pink
           resetView.continueBtn.setShadow(shadowColor: UIColor.pink.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 1, shadowRaduis: 4)
        }

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.resignFirstResponder() {
            return false
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !(string == "") {
            textField.text = string
            if textField == resetView.textField1 {
                resetView.textField2.becomeFirstResponder()
            }
            else if textField == resetView.textField2 {
                resetView.textField3.becomeFirstResponder()
            }
            else if textField == resetView.textField3 {
                resetView.textField4.becomeFirstResponder()
            }else if textField == resetView.textField4 {
                resetView.textField5.becomeFirstResponder()
            }else if textField == resetView.textField5 {
                resetView.textField6.becomeFirstResponder()
            }
            else {
                textField.resignFirstResponder()
            }
            return false
        }
        return true
    }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        if (textField.text?.count ?? 0) > 0 {
//            
//        }
//        return true
//    }
}
