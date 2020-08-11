//
//  DashboardView.swift
//  TryOnMe!
//
//  Created by vipul garg on 2020-07-28.
//  Copyright © 2020 VipulGarg. All rights reserved.
//


import Foundation
import UIKit

class DashboardView : UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    var productSelected = Products()
    var modelName = ""
    
     //var tblIdArray = Array<String>()
//    var tblDict = ["Product a":"Company A", "Product b":"Company B", "Product c":"Company B", "Product d":"Company A", "Product e":"Company B", "Product f":"Company A", "Product g":"Company B", "Product h":"Company A", "Product i":"Company A"] as [String : Any]
    
    
    @IBOutlet weak var tableView: UITableView!
    
  
    override func viewDidLoad() {
      super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DummyDataClass.addProducts()
         self.tableView.reloadData()
    }
      
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Products.dictOfProducts.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "productcell", for: indexPath)
//
//          let cell = tableView.dequeueReusableCell(withIdentifier: "productcell") as! ProductCell
//
//
//
//
//        let keysArray = [String] (tblDict.keys)
////        cell.textLabel?.text = "\(keysArray[indexPath.row]) \n\(tblDict[keysArray[indexPath.row]] ?? 0)  "
////        cell.textLabel?.numberOfLines = 2
//
//        cell.companyLabel = searcharray[indexPath.row].productsName
//        cell.pr.text = searcharray[indexPath.row].productDescription
//
//
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "productcell") as! ProductCell
    
         cell.productName.text = Products.dictOfProducts[indexPath.row]?.productModel
         cell.productImage.image = UIImage(named:"kawhi")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print(indexPath.row)
         modelName = String(indexPath.row)
         performSegue(withIdentifier: "arkitVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if(segue.identifier == "arkitVC"){
            var vc = segue.destination as! ViewController
             vc.modelName = self.modelName
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 250
       }
    
}
