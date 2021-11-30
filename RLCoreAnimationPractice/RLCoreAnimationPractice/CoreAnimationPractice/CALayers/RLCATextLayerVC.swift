//
//  RLCATextLayerVC.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/30.
//

import UIKit

class RLCATextLayerVC: RLCALayerPracticeBaseVC {
    
}

extension RLCATextLayerVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

@objc extension RLCATextLayerVC {
    
    override func addSubViews() {
        super.addSubViews()
        
        layerView.backgroundColor = .gray
    }
    
    override func relayoutSubViews() {
        layerView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        layerView.center = view.center
    }
    
    override func addSubLayers() {
        addTextLayer()
    }
    
}

@objc extension RLCATextLayerVC {
    
    func addTextLayer() {
        // Create a text layer
        let textLayer = CATextLayer()
        textLayer.frame = layerView.bounds
        layerView.layer.addSublayer(textLayer)
        
        // Set text attributes
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.alignmentMode = .justified
        textLayer.isWrapped = true
        textLayer.contentsScale = UIScreen.main.scale
        
        // choose a font
        let font = UIFont.systemFont(ofSize: 15)
        
        // set layer font
        textLayer.font = CGFont(font.fontName as CFString)
        textLayer.fontSize = font.pointSize
        
        textLayer.string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis"
    }
    
}
