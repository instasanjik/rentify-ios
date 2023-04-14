//
//  LandlordsTableViewCell.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 13.04.2023.
//

import UIKit
import SnapKit


class LandlordsTableViewCell: UITableViewCell {
    
    static let id = "LandlordsTableViewCell"
    
    lazy var landlordsLabel: UILabel = {
        let label = UILabel()
        label.text = "Landlords in Astana"
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    lazy var adsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 24
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(LandlordsCollectionViewCell.self, forCellWithReuseIdentifier: "LandlordsCollectionViewCell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        setupMainLabel()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LandlordsTableViewCell {
    
    fileprivate func setupMainLabel() {
        addSubview(landlordsLabel)
        landlordsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview()
            make.height.equalTo(22)
        }
    }
    
    fileprivate func setupCollectionView() {
        addSubview(adsCollectionView)
        adsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(landlordsLabel.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
    }
    
}

extension LandlordsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandlordsCollectionViewCell", for: indexPath) as! LandlordsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 131, height: 110)
    }
    
    
}
