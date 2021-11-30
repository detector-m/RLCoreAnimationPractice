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
        
//        addSubLayers()
//
//        setLayerContents()
//
//        setLayerContentsRect()
//
//        setLayerContentsCenter()
//
//        setLayerShadow()
        
//        setLayerTranform()
        
        setLayer3DTranform()
    }
    
}

@objc extension RLCoreAnimationPracticeVC {
    
    override func addSubViews() {
        super.addSubViews()
        
        
        layerView.backgroundColor = .white
        view.addSubview(layerView)
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
    
    func setLayerShadow() {
        let image = UIImage(named: "motion")
        
        layerView.layer.contents = image?.cgImage
        layerView.layer.contentsGravity = .center
        layerView.layer.contentsScale = 2
        
        layerView.layer.shadowOpacity = 0.5
        layerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        // 阴影的模糊度
        layerView.layer.shadowRadius = 10
    }
    
}

// MARK: - 变换
@objc extension RLCoreAnimationPracticeVC {
    
    func setLayerTranform() {
        setLayerContents()
    
//        setLayerRotationTransform()
        
        setLayerBlendTransform()
    }
    
    // 旋转变换
    func setLayerRotationTransform() {
        let rotationTransform = CGAffineTransform(rotationAngle: .pi / 4)
        layerView.layer.setAffineTransform(rotationTransform)
    }
    
    // 我们来用这些函数组合一个更加复杂的变换，先缩小50%，再旋转30度，最后向右移动200个像素
    func setLayerBlendTransform() {
        // create a new transform
        var cTransform = CGAffineTransform.identity
        // scale by 50%
        cTransform = cTransform.scaledBy(x: 0.5, y: 0.5)
        // translate by 200 points
        cTransform = cTransform.translatedBy(x: 200, y: 200)
        
        // rotate by 30 degrees
        cTransform = cTransform.rotated(by: .pi * 1.2)
        
        layerView.layer.setAffineTransform(cTransform)
    }
    
}

// MARK: - 3D变换
@objc extension RLCoreAnimationPracticeVC {
    
    func setLayer3DTranform() {
        setLayerContents()
    
//        setLayer3DRotationTransform()
        setLayer3DRotationDistanceTransform()
    }

    func setLayer3DRotationTransform() {
        let rotationTransform = CATransform3DMakeRotation(.pi / 4, 0, 1, 0)
        
        layerView.layer.transform = rotationTransform
    }
    
    // 透视 相机视角
    func setLayer3DRotationDistanceTransform() {
        var transform = CATransform3DIdentity
        // 相机视角
        transform.m34 = -(1.0 / 500.0)
        
        transform = CATransform3DRotate(transform, .pi / 4, 0, 1, 0)
        
        layerView.layer.transform = transform
    }

}

extension RLCoreAnimationPracticeVC: CALayerDelegate {
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
    
}
