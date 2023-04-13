//
//  HousesViewController.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 12.04.2023.
//

import UIKit
import SnapKit

class HousesViewController: UIViewController {
    
    let mainTableViewCellIds: [String] = [
        DiscoverTableViewCell.id
    ]
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(DiscoverTableViewCell.self, forCellReuseIdentifier: DiscoverTableViewCell.id)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainTableView()
    }

}

extension HousesViewController {
    
    fileprivate func setupMainTableView() {
        view.addSubview(mainTableView)
        
        mainTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.snp.topMargin)
            make.bottom.equalToSuperview()
        }
    }
    
    
}

extension HousesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(mainTableViewCellIds.count)
        return mainTableViewCellIds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: mainTableViewCellIds[indexPath.row], for: indexPath) as! DiscoverTableViewCell
//        switch indexPath.row {
//        case 0:
//            cell = tableView.dequeueReusableCell(withIdentifier: mainTableViewCellIds[indexPath.row], for: indexPath) as! DiscoverTableViewCell
            
//        default:
//            print(1)
//        }
        return cell
    }
    
    
}
