//
//  RLCAGradientLayerVC.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/30.
//

import UIKit

class RLCAGradientLayerVC: RLCALayerPracticeBaseVC {

}


extension RLCAGradientLayerVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

@objc extension RLCAGradientLayerVC {
    
    override func addSubViews() {
        super.addSubViews()
        
        layerView.backgroundColor = .gray
    }
    
    override func relayoutSubViews() {
        layerView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        layerView.center = view.center
    }
    
    override func addSubLayers() {
//        addNormalGradientLayer()
        
        addLocationsGradientLayer()
    }
    
}

extension RLCAGradientLayerVC {
    
    // 基础渐变
    func addNormalGradientLayer() {
        // creat gradient layer and add it to layer view
        let gradentLayer: CAGradientLayer = CAGradientLayer()
        gradentLayer.frame = layerView.bounds
        
        layerView.layer.addSublayer(gradentLayer)
        
        // set gradient colors
        gradentLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        
        // set gradient start and end points
        gradentLayer.startPoint = CGPoint(x: 0, y: 0)
        gradentLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    // 多重渐变
    func addLocationsGradientLayer() {
        let gradentLayer: CAGradientLayer = CAGradientLayer()
        gradentLayer.frame = layerView.bounds
        
        layerView.layer.addSublayer(gradentLayer)
        
        // set gradient colors
        gradentLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.blue.cgColor]
        
        // set locations
        gradentLayer.locations = [NSNumber(value: 0.0), NSNumber(value: 0.5), NSNumber(value: 1)]
        
        // set gradient start and end points
        gradentLayer.startPoint = CGPoint(x: 0, y: 1)
        gradentLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
}
