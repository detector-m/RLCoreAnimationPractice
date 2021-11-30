//
//  RLCAShapeLayerPracticeVC.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/30.
//

import UIKit

class RLCAShapeLayerPracticeVC: RLBaseVC {
    
    lazy var layerView = UIView()
    
}


extension RLCAShapeLayerPracticeVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addShapeLayer()
    }
    
}

@objc extension RLCAShapeLayerPracticeVC {
    
    override func addSubViews() {
        super.addSubViews()
        
        
        layerView.backgroundColor = .gray
        view.addSubview(layerView)
    }
    
    override func relayoutSubViews() {
        layerView.frame = view.bounds
        layerView.center = view.center
    }
    
}

@objc extension RLCAShapeLayerPracticeVC {
    
    func addShapeLayer() {
        // Create path
//        let path = getSimplePersonPath()
        let path = getRectCornerPath()

        // Create shape layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
        shapeLayer.path = path.cgPath
        
        // add it to view
        layerView.layer.addSublayer(shapeLayer)
    }
    
    // 绘制火柴人
    func getSimplePersonPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 175, y: 100))
        
        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        path.move(to: CGPoint(x: 150, y: 125))
        path.addLine(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 125, y: 225))
        path.move(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 175, y: 225))
        path.move(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 200, y: 150))
        
        return path
    }
    
    // 绘制若干个圆角矩形
    func getRectCornerPath() -> UIBezierPath {
        let rect = CGRect(x: 50, y: 100, width: 100, height: 100)
        
        let radii = CGSize(width: 20, height: 20)
        
        let corners: UIRectCorner = [.topRight, .bottomRight, .bottomLeft]
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: radii)
        
        return path
    }
    
}
