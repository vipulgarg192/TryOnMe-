//
//  DummyDataClass.swift
//  TryOnMe!
//
//  Created by vipul garg on 2020-08-10.
//  Copyright © 2020 VipulGarg. All rights reserved.
//

import Foundation
import UIKit

class DummyDataClass {
    
    static func addProducts() {
        
          var image = UIImage(imageLiteralResourceName: "man1.jpg")
           let p1 = Products( productID: 0 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "man1")
           
           Products.addProductsToList(products: p1)
           
             image = UIImage(imageLiteralResourceName: "man1.jpg")
                     let p2 = Products( productID: 1 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "man2")
                     
                     Products.addProductsToList(products: p2)
        
         image = UIImage(imageLiteralResourceName: "man1.jpg")
                  let p3 = Products( productID: 2 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "man3")
                  
                  Products.addProductsToList(products: p3)
        
         image = UIImage(imageLiteralResourceName: "man1.jpg")
                  let p4 = Products( productID: 3 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "woman1")
                  
                  Products.addProductsToList(products: p4)
        
         image = UIImage(imageLiteralResourceName: "man1.jpg")
                  let p5 = Products( productID: 4 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "woman2")
                  
                  Products.addProductsToList(products: p5)
        
         image = UIImage(imageLiteralResourceName: "man1.jpg")
                  let p6 = Products( productID: 5 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "woman3")
                  
                  Products.addProductsToList(products: p6)
        
         image = UIImage(imageLiteralResourceName: "man1.jpg")
                  let p7 = Products( productID: 6 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "woman4")
                  
                  Products.addProductsToList(products: p7)
        
         image = UIImage(imageLiteralResourceName: "man1.jpg")
                  let p8 = Products( productID: 7 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "woman5")
                  
                  Products.addProductsToList(products: p8)
        
         image = UIImage(imageLiteralResourceName: "man1.jpg")
                  let p9 = Products( productID: 8 , productName: "Tshirt", productCompany: "Star Outfitters", productImage: image ,productModel : "woman6")
                  
                  Products.addProductsToList(products: p9)
        
        
        
    }
    
}
