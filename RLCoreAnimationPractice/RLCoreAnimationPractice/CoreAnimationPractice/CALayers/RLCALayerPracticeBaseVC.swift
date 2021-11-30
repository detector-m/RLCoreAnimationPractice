//
//  RLCALayerPracticeBaseVC.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/30.
//

import UIKit

class RLCALayerPracticeBaseVC: RLBaseVC {

    lazy var layerView = UIView()

}

extension RLCALayerPracticeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubLayers()
    }
    
}

@objc extension RLCALayerPracticeBaseVC {
    
    override func addSubViews() {
        super.addSubViews()
        
        layerView.backgroundColor = .gray
        view.addSubview(layerView)
    }
    
    override func relayoutSubViews() {
        layerView.frame = view.bounds
        layerView.center = view.center
    }
    
    func addSubLayers() {
        
    }
    
}
