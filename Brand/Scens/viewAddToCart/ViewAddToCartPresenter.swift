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
    func getConfigDetailsWithSlug ()
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
    var slug : String? {get}
    
    func getIndexSelectedQuantity () -> Int
    func getNumberOfItemsInPicker() -> Int
    
    func addProductToCart ()
    func updateProductInCart ()
    
    
    func getConfigDetailsWithSlug (  )
    
    
}


class AddToCartPresenter : ProAddToCartPresenter {
    

    var addToCartView: ProAddToCartView!

    var slug : String? = nil 
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
        
        self.addToCartView = addToCartView
        setDataConfig(configID: configID , saleProduct: saleProduct , priceProduct: priceProduct , quantityProduct: quantityProduct , maxQuantity: maxQuantity , minQuantity: minQuantity , productOptions: productOptions , cartID: cartID , selectedOptionsToEdit: selectedOptionsToEdit , selectedQuantityToEdit: selectedQuantityToEdit , isEdit: isEdit )
        
    }
    
    init(addToCartView: ProAddToCartView , slug : String ) {
        self.addToCartView = addToCartView
        self.slug = slug
    }
    
    private func setDataConfig (configID : Int , saleProduct: Double, priceProduct: Double, quantityProduct: Int, maxQuantity: Int, minQuantity: Int, productOptions: [ProductOptions] ,
                                  cartID : Int = 0 ,
                                  selectedOptionsToEdit : [SelectedOption] = [] , selectedQuantityToEdit : Int = 0 , isEdit : Bool = false  ) {
        
        self.configID = configID
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
    
    func getConfigDetailsWithSlug ( ) {
        
        APIClient.getItemDetail(slug: self.slug ?? "" ) { (result) in
            switch result{
            case .success(let data):

                let config = data.config
                self.setDataConfig(configID: config.id ?? 0 , saleProduct: Double( config.sale ?? 0.0 ) , priceProduct: Double(config.ReturnPriceAfterSale(price: Double(config.price ?? 0), sale: Double(config.sale ?? 0))) , quantityProduct : config.qty ?? 0 , maxQuantity: config.maxQty ?? 0 , minQuantity: config.minQty ?? 0 , productOptions: config.productOptions ?? [] )
                self.addToCartView.getConfigDetailsWithSlug()
                return
            case .failure(let error):
                print("error get item datails : \(error.localizedDescription)")
                return
            }
        }
        
        
    }
    
    
    
}

