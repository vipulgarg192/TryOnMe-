//
//  ViewController.swift
//  TryOnMe!
//
//  Created by vipul garg on 2020-07-23.
//  Copyright © 2020 VipulGarg. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var sizeStepper:UIStepper!
    @IBOutlet weak var slider: UISlider!
    
//    var SceneNode : SCNNode!
    var sceneNode = SCNNode()

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//        
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        configuration.planeDetection = [.horizontal]
        sceneView.session.delegate = self
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         if let touch = touches.first {
                   let touchLocation = touch.location(in: sceneView)
                   
                   let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
             
             if let hitresult = results.first {
                 let diceScene = SCNScene(named: "art.scnassets/girl1.scn")!
                                 
//                if let SceneNode = diceScene.rootNode.childNode(withName : "_material_1", recursively : true){
//
//                     SceneNode.position = SCNVector3(x: hitresult.worldTransform.columns.3.x,
//                         y: hitresult.worldTransform.columns.3.y,
//                         z: hitresult.worldTransform.columns.3.z)
//
//                     SceneNode.scale = SCNVector3(x: 3, y: 3, z: 3)
//
//                     sceneView.scene.rootNode.addChildNode(SceneNode)
//
//                     let randomY = Float(arc4random_uniform(4)) * (Float.pi)
//                     SceneNode.runAction(SCNAction.rotateBy(x: 0, y: CGFloat(randomY), z: 0, duration: 1))
//
//                 }
                
                   sceneNode = diceScene.rootNode.childNode(withName : "_material_1", recursively : true)!
                         sceneNode.position  = SCNVector3(x: hitresult.worldTransform.columns.3.x, y: hitresult.worldTransform.columns.3.y, z: hitresult.worldTransform.columns.3.z)
                
                         sceneView.scene.rootNode.addChildNode(sceneNode)
             }
        }
     }
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    
        sceneNode.scale = SCNVector3(x: Float(sender.value), y: Float(sender.value), z: Float(sender.value))
        
        sceneNode.scale = SCNVector3(x: Float(sender.value), y: Float(sender.value), z: Float(sender.value))
        
        
//        valueLabel.text = Int(sender.value).description
    }
   
    
    @IBAction func mannequinRotation(_ sender: UISlider) {
        print(sender.value)
        sceneNode.eulerAngles = SCNVector3Make(0, sender.value, 0);
        }
    
}
