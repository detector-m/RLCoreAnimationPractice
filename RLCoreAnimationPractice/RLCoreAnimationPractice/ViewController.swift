//
//  ViewController.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/26.
//

import UIKit

class ViewController: RLBaseVC {
    
    static let cellId = "TBCell"
    
    fileprivate lazy var tableView: UITableView = UITableView(frame: view.bounds, style: .grouped)
    
    fileprivate lazy var practiceTypes: [RLCAPracticeType] = [.normal, .shapeLayer, .textLayer, .transformLayer, .gradientLayer]

}

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Core Animation"
        
        configTableView()
    }
    
}

@objc extension ViewController {
    
    override func addSubViews() {
        super.addSubViews()
        view.addSubview(tableView)
    }
    
    override func relayoutSubViews() {
        tableView.frame = view.bounds
    }
    
}


extension ViewController {
    
    fileprivate func configTableView() {
//        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 0.001
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellId)
    }
    
}


// MARK: - UITableViewDeletate & UITableviewDataSource
extension ViewController: UITableViewDataSource & UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return practiceTypes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cType = practiceTypes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellId)
        cell?.textLabel?.text = cType.string
        cell?.accessoryType = .disclosureIndicator

        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cType = practiceTypes[indexPath.row]

        log.debug("?????? section = \(indexPath.section) row = \(indexPath.row), cType = \(cType.string)")
        
        switch cType {
        case .normal:
            gotoCoreAnimationPractice(type: cType)
        
        case .shapeLayer:
            gotoShapeLayer(type: cType)
            
        case .textLayer:
            gotoTextLayer(type: cType)
            
        case .transformLayer:
            gotoTransformLayer(type: cType)
            
        case .gradientLayer:
            gotoGradientLayerVC(type: cType)
        }
        
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction.init(style: .normal, title: R.string.trainning.??????()) { [weak self] (_, _, _) in
//            self?.swipDelete(indexPath: indexPath)
//        }
//        deleteAction.backgroundColor = Red
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//        configuration.performsFirstActionWithFullSwipe = false
//        return configuration
//    }
//
//    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
////        view.setNeedsLayout()
//        setupSlideBtnWithEditingIndexPath(tableView: tableView)
//    }
    
}

// MARK: -
extension ViewController {
    
    fileprivate func gotoCoreAnimationPractice(type: RLCAPracticeType) {
        let vc = RLCoreAnimationPracticeVC()
        vc.title = type.string
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func gotoShapeLayer(type: RLCAPracticeType) {
        let vc = RLCAShapeLayerPracticeVC()
        vc.title = type.string
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func gotoTextLayer(type: RLCAPracticeType) {
        let vc = RLCATextLayerVC()
        vc.title = type.string
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func gotoTransformLayer(type: RLCAPracticeType) {
        let vc = RLCATransformLayerVC()
        vc.title = type.string
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func gotoGradientLayerVC(type: RLCAPracticeType) {
        gotoLayerVC(vcType: RLCAGradientLayerVC.self, type: type)
    }
    
}


extension ViewController {
    
    fileprivate func gotoLayerVC<T: UIViewController>(vcType: T.Type, type: RLCAPracticeType) {
        let vc = vcType.init()
        vc.title = type.string
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
