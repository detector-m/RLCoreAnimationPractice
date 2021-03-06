//
//  RLCAPracticeType.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/30.
//

import Foundation


enum RLCAPracticeType {
    
    case normal
    case shapeLayer
    case textLayer
    case transformLayer
    case gradientLayer
        
}

extension RLCAPracticeType {
    
    var string: String {
        switch self {
        case .normal:
            return "normal"
            
        case .shapeLayer:
            return "shape layer"
            
        case .textLayer:
            return "text layer"
            
        case .transformLayer:
            return "transform layer"
        
        case .gradientLayer:
            return "gradient layer"
        }
    }
    
}
