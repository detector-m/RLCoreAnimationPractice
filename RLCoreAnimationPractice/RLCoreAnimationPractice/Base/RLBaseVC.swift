//
//  RLBaseVC.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/26.
//

import UIKit

class RLBaseVC: UIViewController {

}

@objc extension RLBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubViews()
        relayoutSubViews()
    }
    
}

@objc extension RLBaseVC: RLUIBaseProtocol {
    
    func addSubViews() {
        
    }
    
    func relayoutSubViews() {
        
    }
    
}
