//
//  Products.swift
//  TryOnMe!
//
//  Created by vipul garg on 2020-08-10.
//  Copyright © 2020 VipulGarg. All rights reserved.
//

import Foundation
import UIKit

class Products {
    
        var  productsId  : Int
        var  productsName : String
        var  productCompany : String
        var  productImage : UIImage
        var  productModel : String
    
    
    static var dictOfProducts = [Int : Products]()
    
    init() {

        self.productsId = Int()
        self.productsName = String()
        self.productCompany = String()
        self.productImage = UIImage()
        self.productModel = String()
    }
    
    init( productID : Int , productName : String , productCompany : String, productImage : UIImage , productModel : String){
            self.productsId = productID
            self.productsName = productName
            self.productCompany = productCompany
            self.productImage = productImage
            self.productModel = productModel
        }
    
    static func addProductsToList(products : Products){
        dictOfProducts[products.productsId] =  products
    }
    
    
    
}
