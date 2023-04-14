//
//  PropertyCollectionViewCell.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 14.04.2023.
//

import UIKit
import SnapKit

class PropertyCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                nameLabel.textColor = .white
                backgroundColor = UIColor(red: 0.254, green: 0.254, blue: 0.254, alpha: 1)
            } else {
                nameLabel.textColor = .black
                backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
            }
        }
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = name
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 16
        clipsToBounds = true
        setupNameLabel()
    }
    
    
}

extension PropertyCollectionViewCell {
    
    fileprivate func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(6)
        }
    }
    
    
}
