//
//  HousesViewController.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 12.04.2023.
//

import UIKit
import SnapKit

class HousesViewController: UIViewController {
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.delegate = self
        tableView.backgroundColor = .red
//        tableView.register(1, forCellReuseIdentifier: "MainTableViewCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainTableView()
        // Do any additional setup after loading the view.
    }

}

extension HousesViewController {
    
    fileprivate func setupMainTableView() {
        view.addSubview(mainTableView)
        
        mainTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(view.snp.topMargin).inset(24)
            make.bottom.equalToSuperview()
        }
    }
    
    
}

extension HousesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
    
    
}
