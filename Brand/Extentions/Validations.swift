//
//  Validations.swift
//  Brands
//
//  Created by Nada Dyaa on 2/27/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//




import Foundation
class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
                
            case .city:
                if let tempValue =
            isValidString((valueToBeChecked.inputValue, .city, .emptyCity, .inValidcity)) {
                    return tempValue
                }
           
            case .postal_code:
                if let tempValue =
              isValidString((valueToBeChecked.inputValue, .postal_code, .inValidCode)) {
                    return tempValue
                }
            case .phone:
                if let tempValue =
                    
                    isValidString((valueToBeChecked.inputValue, .phone, .emptyPhone, .inValidPhone)) {
                    return tempValue
                }
            case .lat:
                if let tempValue =
                    
                    isValidString((valueToBeChecked.inputValue, .lat, .invalidLat)) {
                    return tempValue
                }
         
            case .Addressname:
                if let tempValue =
                    isValidString((valueToBeChecked.inputValue, .city, .emptyaddressname, .inValidAddName)) {
                    return tempValue
                }
            case .PersonName:
                if let tempValue =
                    isValidString((valueToBeChecked.inputValue, .city, .emptyPersonName, .inValidPersonName)) {
                    return tempValue
                }
            case .Lng:
                if let tempValue =
                    
                    isValidString((valueToBeChecked.inputValue, .lat, .invalidLng)) {
                    return tempValue
                }
            case .country:
                if let tempValue =
                    isValidString((valueToBeChecked.inputValue, .country, .emptyCountry, .emptyCountry)) {
                    return tempValue
                }
            case .state:
                if let tempValue =
            isValidString((valueToBeChecked.inputValue, .country, .emptyState, .emptyState)) {
                    return tempValue
                }
            case .Email:
                if let tempValue =
                    
                    isValidString((valueToBeChecked.inputValue, .email, .emptyEmail, .inValideEmail)) {
                    return tempValue
                }
            }
        }
        return .success
    }
    
    func isValidString(_ input: (text: String, regex: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text == "" {
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    func isValidString(_ input: (text: String, regex: RegEx, invalidAlert: AlertMessages)) -> Valid? {
        if input.text == "" {
            return .success
        } else
        if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

enum Alert {        //for failure and success results
    case success
    case failure
    case error
}
//for success or failure of validation with alert message
enum Valid {
    case success
    case failure(Alert, AlertMessages)
}
enum ValidationType {
    case city
    case Addressname
    case PersonName
    case Email
    case postal_code
    case phone
    case lat
    case Lng
    case country
    case state
}
enum RegEx: String {
    case city =  "(?=.*[A-Za-z0-9]).{3,}"
    case postal_code = "(?=.*[0-9]).{5,5}"
    case lat = "(?=.*[0-9]).{1,}"
    case phone = "[0-9]{10,14}"
    case  country =   "(?=.*[A-Za-z0-9]).{1,}"
    case email = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

}
enum AlertMessages: String {

    case invalidLat = "The latitude must be a number"
     case invalidLng = "The longitude must be a number."
    case inValidPhone = "Invalid Phone"
    case inValidCode = "Invalid Postal Code , Must be 5 letters "
    case inValidcity = "Invalid City"
     case inValidPersonName = "Invalid Person Name"
     case inValidAddName = "Invalid Address Name"
    case inValideEmail = "Invalid Email"
    
    case emptyPhone = "Empty Phone"
    case emptyaddressname = "Empty Address name"
    case emptyPersonName = "Empty Person Name"
    case emptyCity = "Empty city"
    case emptyCountry = "Must Select Your Country"
    case emptyState =  "Must Select Your State"
    case emptyEmail = "Empty Email"
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
