//
//  RLBaseView.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/29.
//

import UIKit

class RLBaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews()
        relayoutSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

@objc extension RLBaseView: RLUIBaseProtocol {
    
    func addSubViews() {
        
    }
    
    func relayoutSubViews() {
        
    }
    
}
