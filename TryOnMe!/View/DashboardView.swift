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
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
      super.viewDidLoad()
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setupTableView(){
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashcell", for: indexPath)
        
        return cell
    }
    
}
