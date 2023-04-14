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
        DiscoverTableViewCell.id,
        LandlordsTableViewCell.id,
        NewAdsTableViewCell.id
    ]
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(DiscoverTableViewCell.self, forCellReuseIdentifier: DiscoverTableViewCell.id)
        tableView.register(LandlordsTableViewCell.self, forCellReuseIdentifier: LandlordsTableViewCell.id)
        tableView.register(NewAdsTableViewCell.self, forCellReuseIdentifier: NewAdsTableViewCell.id)
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
            make.top.equalTo(view.snp.topMargin)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
}

extension HousesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTableViewCellIds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainTableViewCellIds[indexPath.row], for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return DiscoverTableViewCell.REQUIRED_HEIGHT
        case 1: return LandlordsTableViewCell.REQUIRED_HEIGHT
        case 2: return NewAdsTableViewCell.REQUIRED_HEIGHT
        default: return 210
        }
    }
    
    
}
