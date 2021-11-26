//
//  ViewController.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/26.
//

import UIKit

class ViewController: UIViewController {
    
    static let cellId = "TBCell"
    
    fileprivate lazy var tableView: UITableView = UITableView(frame: view.bounds, style: .grouped)

}

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App"
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        configTableView()
    }
    
}

extension ViewController {
    
    fileprivate func configTableView() {
        tableView.separatorStyle = .none
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellId)
        cell?.textLabel?.text = "Core Animation"
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
        log.debug("点击 section = \(indexPath.section) row = \(indexPath.row)")
        
        gotoCoreAnimationPractice()
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction.init(style: .normal, title: R.string.trainning.删除()) { [weak self] (_, _, _) in
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
    
    fileprivate func gotoCoreAnimationPractice() {
        let vc = RLCoreAnimationPracticeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
