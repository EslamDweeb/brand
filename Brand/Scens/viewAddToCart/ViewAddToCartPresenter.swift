//
//  ViewAddToCartPresenter.swift
//  Brand
//
//  Created by iOS on 8/5/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

protocol ProAddToCartView {
    func productAddedToCart (model : ModelAddedCartData)
    func productUpdatedInCart (model : ModelAddedCartData)
    func errorAddProductToCart(errors : String)
}

protocol ProAddToCartPresenter {
    
    var addToCartView : ProAddToCartView! {get}
    
    var saleProduct : Double { get }
    var priceProduct : Double { get }
    var quantityProduct : Int { get }
    var maxQuantity : Int { get }
    var minQuantity : Int { get }
    var configID : Int {get}
    var productOptions : [ProductOptions] { get }
    var selectedValues : [(parentID : Int , value : ProductOptionValues )] { get set }
    var selectedProductOption : [ ProductOptions ] { get set }
    var selectedQuantity : Int {get set}
    var cartID : Int {get }
    var selectedOptionsToEdit : [SelectedOption] {get}
    var selectedQuantityToEdit : Int { get }
    var isEdit : Bool {get}
    
    func getIndexSelectedQuantity () -> Int
    func getNumberOfItemsInPicker() -> Int
    
    func addProductToCart ()
    func updateProductInCart ()
    
}


class AddToCartPresenter : ProAddToCartPresenter {
    

    var addToCartView: ProAddToCartView!

    var configID: Int = 0
    var saleProduct: Double = 0.0
    var priceProduct: Double = 0.0
    var quantityProduct: Int = 0
    var maxQuantity: Int = 0
    var minQuantity: Int = 0
    var productOptions: [ProductOptions] = []
    var selectedValues: [(parentID: Int, value: ProductOptionValues )] = []
    var selectedProductOption: [ProductOptions] = []
    var selectedQuantity = 0
    
    var cartID: Int = 0
    var selectedOptionsToEdit : [SelectedOption] = []
    var selectedQuantityToEdit : Int = 0
    var isEdit: Bool = false
    
    init(addToCartView: ProAddToCartView , configID : Int , saleProduct: Double, priceProduct: Double, quantityProduct: Int, maxQuantity: Int, minQuantity: Int, productOptions: [ProductOptions] ,
         cartID : Int = 0 ,
         selectedOptionsToEdit : [SelectedOption] = [] , selectedQuantityToEdit : Int = 0 , isEdit : Bool = false  ) {
        self.configID = configID
        self.addToCartView = addToCartView
        self.saleProduct = saleProduct
        self.priceProduct = priceProduct
        self.quantityProduct = quantityProduct
        self.minQuantity = minQuantity
        self.maxQuantity = maxQuantity
        self.productOptions = productOptions
        self.cartID = cartID
        self.selectedOptionsToEdit = selectedOptionsToEdit
        self.selectedQuantityToEdit = selectedQuantityToEdit
        self.isEdit = isEdit
        
    }
    
    func getNumberOfItemsInPicker() -> Int {
        if maxQuantity < minQuantity {
            return 0
        }
        return maxQuantity  - minQuantity
    }
    
    func getIndexSelectedQuantity () -> Int {
        var index = -1
        for i in minQuantity ... maxQuantity {
            index += 1
            if i == selectedQuantityToEdit {
                return index
            }
        }
        return 0
    }
    
    func addProductToCart() {
        let optionIDS = selectedProductOption.map({$0.optionID})
        let optionValuesIDS = selectedValues.map({$0.value.id})
        APIClient.AddProductToCart(config_id: configID , qty: selectedQuantity , option_ids: (optionIDS.count > 0) ? optionIDS : nil , product_option_value_ids: (optionValuesIDS.count > 0) ? optionValuesIDS : nil  ) { [weak self] (result) in
            switch result {
            case .success(let data ):
                if data.errors != nil {
                    let error = getError( error: data.errors ?? [:] )
                    self?.addToCartView.errorAddProductToCart(errors: error)
                    return
                }
                self?.addToCartView.productAddedToCart(model: data )
                break
            case .failure(let error):
                self?.addToCartView.errorAddProductToCart(errors: error.localizedDescription )
                break
            }
        }
    }
    
    func updateProductInCart() {
        let optionIDS = selectedProductOption.map({$0.optionID})
        let optionValuesIDS = selectedValues.map({$0.value.id})
        APIClient.updateProductInCart(cartID: cartID , config_id: configID , qty: selectedQuantity , option_ids: (optionIDS.count > 0) ? optionIDS : nil , product_option_value_ids: (optionValuesIDS.count > 0) ? optionValuesIDS : nil  ) { [weak self] (result) in
            switch result {
            case .success(let data ):
                if data.errors != nil {
                    let error = getError( error: data.errors ?? [:] )
                    self?.addToCartView.errorAddProductToCart(errors: error)
                    return
                }
                self?.addToCartView.productUpdatedInCart(model: data )
                break
            case .failure(let error):
                self?.addToCartView.errorAddProductToCart(errors: error.localizedDescription )
                break
            }
        }
        
    }
    
}

