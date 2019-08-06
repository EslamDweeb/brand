//
//  ViewAddToCartPresenter.swift
//  Brand
//
//  Created by iOS on 8/5/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

protocol ProAddToCartView {

}

protocol ProAddToCartPresenter {
    
    var addToCartView : ProAddToCartView! {get}
    
    var saleProduct : Double { get }
    var priceProduct : Double { get }
    var quantityProduct : Int { get }
    var maxQuantity : Int { get }
    var minQuantity : Int { get }
    var productOptions : [ProductOptions] { get }

    var selectedValues : [(parentID : Int , value : ProductOptionValues )] { get set }
    var selectedProductOption : [ ProductOptions ] { get set }
    var selectedQuantity : Int {get set}
    
    func getNumberOfItemsInPicker() -> Int
    
}


class AddToCartPresenter : ProAddToCartPresenter {
    
    var addToCartView: ProAddToCartView!

    var saleProduct: Double = 0.0
    var priceProduct: Double = 0.0
    var quantityProduct: Int = 0
    var maxQuantity: Int = 0
    var minQuantity: Int = 0
    var productOptions: [ProductOptions] = []
    var selectedValues: [(parentID: Int, value: ProductOptionValues )] = []
    var selectedProductOption: [ProductOptions] = []
    var selectedQuantity = 0
    
    init(addToCartView: ProAddToCartView , saleProduct: Double, priceProduct: Double, quantityProduct: Int, maxQuantity: Int, minQuantity: Int, productOptions: [ProductOptions]) {
        self.addToCartView = addToCartView
        self.saleProduct = saleProduct
        self.priceProduct = priceProduct
        self.quantityProduct = quantityProduct
        self.minQuantity = minQuantity
        self.maxQuantity = maxQuantity
        self.productOptions = productOptions
        
    }
    
    func getNumberOfItemsInPicker() -> Int {
        if maxQuantity < minQuantity {
            return 0
        }
        return maxQuantity  - minQuantity
    }
    
    
}
