//
//  RLCATransformLayerVC.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/30.
//

import UIKit

class RLCATransformLayerVC: RLCALayerPracticeBaseVC {

}

extension RLCATransformLayerVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

@objc extension RLCATransformLayerVC {
    
    override func addSubViews() {
        super.addSubViews()
        
        layerView.backgroundColor = .gray
    }
    
    override func relayoutSubViews() {
        layerView.frame = view.bounds
        layerView.center = view.center
    }
    
    override func addSubLayers() {
        // 设置视角变化 set up the perspective transform
        var pt = CATransform3DIdentity
        pt.m34 = -1.0 / 500.0
        layerView.layer.sublayerTransform = pt
        
        // set up the transofrm for cube 1 and add it
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, -100, 20, 0)
//        c1t = CATransform3DRotate(c1t, -.pi / 18, 0, 1, 0)
//        c1t = CATransform3DRotate(c1t, .pi / 18, 1, 0, 0)
        let cube1 = getCubeLayer(transform: c1t)
        view.layer.addSublayer(cube1)
        
        // set up the transform for cube 2 and add it
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 100, 0, 0)
        c2t = CATransform3DRotate(c2t, -.pi / 4, 1, 0, 0)
        c2t = CATransform3DRotate(c2t, -.pi / 4,  0, 1, 0)
        let cube2 = getCubeLayer(transform: c2t)
        layerView.layer.addSublayer(cube2)
    }
    
}

extension RLCATransformLayerVC {

    func getFaceLayer(transform: CATransform3D) -> CALayer {
        let faceLayer = CALayer()
        faceLayer.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        
        // apply a random color
        var random = arc4random() % 256
        let red = CGFloat(random) / 255.0
        random = arc4random() % 256
        let green = CGFloat(random) / 255.0
        random = arc4random() % 256
        let blue = CGFloat(random) / 255.0
        faceLayer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor
        
        faceLayer.transform = transform
        
        return faceLayer
    }
    
    func getCubeLayer(transform: CATransform3D) -> CALayer {
        let cube: CATransformLayer = CATransformLayer()
        
        // add cube face
        // face 1
        var ct: CATransform3D = CATransform3DMakeTranslation(0, 0, 50)
        var faceLayer = getFaceLayer(transform: ct)
        cube.addSublayer(faceLayer)
        
        // face 2
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, .pi / 2, 0, 1, 0)
        faceLayer = getFaceLayer(transform: ct)
        cube.addSublayer(faceLayer)
        
        // face 3
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, .pi / 2, 1, 0, 0)
        faceLayer = getFaceLayer(transform: ct)
        cube.addSublayer(faceLayer)
        
        // face 4
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, -.pi / 2, 1, 0, 0)
        faceLayer = getFaceLayer(transform: ct)
        cube.addSublayer(faceLayer)
        
        // face 5
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, -.pi / 2, 0, 1, 0)
        faceLayer = getFaceLayer(transform: ct)
        cube.addSublayer(faceLayer)
        
        // face 6
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, .pi, 0, 1, 0)
        faceLayer = getFaceLayer(transform: ct)
        cube.addSublayer(faceLayer)
        
        // center the cube layer within the view
        let viewSize = layerView.bounds.size
        cube.position = CGPoint(x: viewSize.width / 2, y: viewSize.height / 2)
        
        // apply the transform and return
        cube.transform = transform
        
        return cube
    }
    
}
