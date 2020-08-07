//
//  Mannequin.swift
//  TryOnMe!
//
//  Created by vipul garg on 2020-07-27.
//  Copyright © 2020 VipulGarg. All rights reserved.
//



import UIKit
import SceneKit
import ARKit

class Mannequin: SCNNode {

    var planeAnchor: ARPlaneAnchor
    
    var vaseNode = SCNNode()

    init(_ anchor: ARPlaneAnchor) {
        self.planeAnchor = anchor
        let grid = UIImage(named: "grid.png")
        
         let material = SCNMaterial()
         material.diffuse.contents = grid
         
        self.vaseNode.castsShadow = false
                
        super.init()
        self.addChildNode(vaseNode)


    }
    
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    
     
     
    
}
