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


    @IBOutlet weak var slider: UISlider!
    
    var isMannequinVisible = false
    
    var modelName = ""

    

//    var SceneNode : SCNNode!

    var sceneNode = SCNNode()



 

    

    override func viewDidLoad() {

        super.viewDidLoad()
         print("bj")
         print(modelName)
        modelName = "art.scnassets/woman\(modelName).scn"
         sceneView.delegate = self

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

             
            if isMannequinVisible == false {
                
            
             if let hitresult = results.first {

                 let diceScene = SCNScene(named: modelName)!

                   sceneNode = diceScene.rootNode.childNode(withName : "material", recursively : true)!

                         sceneNode.position  = SCNVector3(x: hitresult.worldTransform.columns.3.x, y: hitresult.worldTransform.columns.3.y, z: hitresult.worldTransform.columns.3.z)

                sceneView.scene.rootNode.addChildNode(sceneNode)
                isMannequinVisible = true

                }
            }

        }

     }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
            
          sceneNode.scale = SCNVector3(x: Float(sender.value), y: Float(sender.value), z: Float(sender.value))
        
        print(sender.value)
    }
    

    @IBAction func mannequinRotation(_ sender: UISlider) {

        print(sender.value)

        sceneNode.eulerAngles = SCNVector3Make(0, sender.value, 0);

        }

    

}
