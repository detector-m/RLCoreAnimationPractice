//
//  RLCoreAnimationPracticeVC.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/26.
//

import UIKit

class RLCoreAnimationPracticeVC: RLBaseVC {
    
    lazy var layerView = UIView()

}

extension RLCoreAnimationPracticeVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        title = "Practice"
    }
    
}

@objc extension RLCoreAnimationPracticeVC {
    
    override func addSubViews() {
        super.addSubViews()
        
        
        layerView.backgroundColor = .white
        view.addSubview(layerView)
        
        addSubLayers()
        
//        setLayerContents()
        
//        setLayerContentsRect()
        
//        setLayerContentsCenter()
    }
    
    override func relayoutSubViews() {
        layerView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        layerView.center = view.center
    }
    
    func addSubLayers() {
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.contentsScale = UIScreen.main.scale
        
        layerView.layer.addSublayer(blueLayer)
        
        blueLayer.delegate = self
        
        // force layer to redraw
        blueLayer.display()
    }
    
    func setLayerContents() {
        let image = UIImage(named: "motion")
        
        layerView.layer.contents = image?.cgImage
        layerView.layer.contentsGravity = .resizeAspect
    }
    
    func setLayerContentsRect() {
        setLayerContents()
        layerView.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.5, height: 0.5)
    }
    
    func setLayerContentsCenter() {
        let image = UIImage(named: "motion")
        
        layerView.layer.contents = image?.cgImage
        
        layerView.layer.contentsCenter = CGRect(x: 0.25, y: 0.2, width: 0.4, height: 0.4)
    }
    
}

extension RLCoreAnimationPracticeVC: CALayerDelegate {
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
    
}
