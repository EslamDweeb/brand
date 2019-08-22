//
//  UIViewControllerExt.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/16/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension UIViewController {
    func handelReachability(reachability: Reachability?) {
        reachability!.whenUnreachable = { _ in
            DispatchQueue.main.async {
                self.createAlert(erroMessage: "CheckConnection")
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged), name: Notification.Name.reachabilityChanged, object: reachability)
        do{
            try reachability!.startNotifier()
        }catch{
            print("Bildirici başlatılamadı")
        }
    }
    @objc func internetChanged (note: Notification){
        let reachability = note.object as! Reachability
        if reachability.connection == .none {
            DispatchQueue.main.async {
                self.createAlert(erroMessage:  "CheckConnection")
            }
        }
    }
    
    // func to create AlertController
    func createAlert(title: String? = nil,erroMessage: String,createButton:Bool? = false) {
        let alert = UIAlertController(title: title ?? "", message: erroMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    func stopNotifier(reachability: Reachability?) {
        var reachability = reachability
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
        reachability = nil
    }
    
    /*
     func to present ViewController with ModalTransition
     UIModalTransitionStyle case if set to nil will use coverVertical by default
     - coverVertical
     - flipHorizontal
     - crossDissolve
     - partialCur
     **/
    func presentViewController(controller: UIViewController,transitionModal:UIModalTransitionStyle? = nil,presentationStyle: UIModalPresentationStyle? = nil) {
        let dest = controller
        dest.modalTransitionStyle = transitionModal ?? .coverVertical
        dest.modalPresentationStyle = presentationStyle ?? .custom
        present(dest, animated: true, completion: nil)
    }
    
    func resizeImageWith(image: UIImage, newSize: CGSize) -> UIImage {
        
        let horizontalRatio = newSize.width / image.size.width
        let verticalRatio = newSize.height / image.size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: image.size.width * ratio, height: image.size.height * ratio)
        var newImage: UIImage
        
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = false
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: newSize.width, height: newSize.height), format: renderFormat)
            newImage = renderer.image {
                (context) in
                image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            }
        } else {
            //            UIGraphicsBeginImageContextWithOptions(CGSize(width: newSize.width, height: newSize.height), isOpaque, 0)
            UIGraphicsBeginImageContextWithOptions(CGSize(width: newSize.width, height: newSize.height), false, 0)
            image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        
        return newImage
    }
    func dismissPressentededControllers(){
        if let presented = self.presentedViewController {
            presented.dismiss(animated: true, completion: nil)
        }else{return}
    }
    
    func presentViewControllerFromStoryBoard(identifier:String){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dest = storyBoard.instantiateViewController(withIdentifier: identifier)
        self.present(dest, animated: true, completion: nil)
    }
    func getDate(date:String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: date) else{return Date()}
        print(date)
        return date // replace Date String
    }
    func getDecodedData<T:Codable>(_ type: T.Type,data:Data) -> T?{
        do{
            let itemData = try JSONDecoder().decode(type, from: data)
            return itemData
        }catch let err{
            print(err)
        }
        return nil
    }
    func setEncodedData<Y:Codable>(data:Y,_ UserDefaultKey:String){
        do{
            let data = try JSONEncoder().encode(data)
            UserDefaults.standard.set(data, forKey: UserDefaultKey)
        }catch let err{
            print(err)
        }
    }
    func presentShareSheet(_ url:String){
        guard let url = URL(string:url) else{return}
        let activityViewController =
            UIActivityViewController(activityItems: [url],
                                     applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    func saveImageDocumentDirectory(image: UIImage){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("apple.jpg")
        print(paths)
        let imageData = image.jpegData(compressionQuality: 1.0)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    func convertDateFormatter(date: String,formate:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd HH:mm:ss"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "your_loc_id")
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
            //            assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateFormat = formate ///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)
        return timeStamp
    }
    
    
    func addViewAddToCart (config : DetailedConfig? = nil  , cartItem : CartItem? = nil  ) {
        
        let viewAddToCart = ViewAddToCart()
        var viewPresenter : ProAddToCartPresenter?
        
        if config == nil && cartItem != nil {
            let configInCart = cartItem?.config
            
            viewPresenter = AddToCartPresenter(addToCartView: viewAddToCart, configID: configInCart?.id ?? 0 , saleProduct: Double(configInCart?.sale ?? "")! , priceProduct:Double(configInCart?.price ?? "")!, quantityProduct : configInCart?.qty ?? 0 , maxQuantity: configInCart?.max_qty ?? 0 , minQuantity: configInCart?.min_qty ?? 0 , productOptions: cartItem?.productOptions ?? [], cartID: cartItem?.id ?? 0 , selectedOptionsToEdit : cartItem?.selectedOptions ?? [] , selectedQuantityToEdit : cartItem?.qty ?? 0 , isEdit: true )
        }else if cartItem == nil , config != nil {
        viewPresenter = AddToCartPresenter(addToCartView: viewAddToCart, configID: config?.id ?? 0 , saleProduct: Double( config?.sale ?? "0.0" ) ?? 0.0 , priceProduct: Double(config?.price ?? "0.0") ?? 0.0 , quantityProduct : config?.qty ?? 0 , maxQuantity: config?.maxQty ?? 0 , minQuantity: config?.minQty ?? 0 , productOptions: config?.productOptions ?? [] )
        }else {
            return
        }
        
        viewAddToCart.presenter = viewPresenter
        viewAddToCart.setPrice()
        
        self.view.addSubview(viewAddToCart)
        viewAddToCart.anchor(top: self.view.topAnchor , left: self.view.leftAnchor , bottom: self.view.bottomAnchor , right: self.view.rightAnchor , centerX: nil , centerY: nil , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
    
    
}
