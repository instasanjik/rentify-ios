//
//  ListHeaderTableViewCell.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 14.04.2023.
//

import UIKit
import SnapKit

class ListHeaderTableViewCell: UITableViewCell {
    
    static let id = "ListHeaderTableViewCell"
    static let REQUIRED_HEIGHT: CGFloat = 84
    
    let PROPERTY_TYPES = ["All announcement", "Houses", "Apartments", "Rooms", "Commercial properties"]
    
    lazy var newAdsLabel: UILabel = {
        let label = UILabel()
        label.text = "List"
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    lazy var propertiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(PropertyCollectionViewCell.self, forCellWithReuseIdentifier: "PropertyCollectionViewCell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupMainLabel()
        setupCollectionView()
    }
    
    
}

extension ListHeaderTableViewCell {
    
    fileprivate func setupMainLabel() {
        addSubview(newAdsLabel)
        newAdsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview()
            make.height.equalTo(22)
        }
    }
    
    fileprivate func setupCollectionView() {
        addSubview(propertiesCollectionView)
        propertiesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(newAdsLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
}



extension ListHeaderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PROPERTY_TYPES.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyCollectionViewCell", for: indexPath) as! PropertyCollectionViewCell
        cell.nameLabel.text = PROPERTY_TYPES[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 32
        let EXTRA_SPACES_FOR_LEFT_RIGHT_PADDING: CGFloat = 12
        let text = PROPERTY_TYPES[indexPath.row]
        let width = text.width(withConstrainedHeight: height, font: .systemFont(ofSize: 12, weight: .bold)) + EXTRA_SPACES_FOR_LEFT_RIGHT_PADDING * 2
        return CGSize(width: width, height: height)
    }
    
    
}
