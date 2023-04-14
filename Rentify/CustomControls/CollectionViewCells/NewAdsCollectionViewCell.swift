//
//  NewAdsCollectionViewCell.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 14.04.2023.
//

import UIKit
import SnapKit


class NewAdsCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.image = UIImage(named: "house")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var specialTextSubstrateView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.258, green: 0.258, blue: 0.258, alpha: 0.38)
        view.clipsToBounds = true
        view.layer.cornerRadius = 9
        return view
    }()
    
    lazy var specialTextLabel: UILabel = {
        let label = UILabel()
        label.text = "$1,200"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        print(1)
    }
    
    override func layoutSubviews() {
        setupImageView()
        setupSpecialText()
    }
    
    
}

extension NewAdsCollectionViewCell {
    
    fileprivate func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(107)
        }
    }
    
    fileprivate func setupSpecialText() {
        addSubview(specialTextSubstrateView)
        specialTextSubstrateView.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().inset(7)
            make.height.equalTo(18)
            make.width.greaterThanOrEqualTo(18)
        }
        
        specialTextSubstrateView.addSubview(specialTextLabel)
        specialTextLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(6)
            make.center.equalToSuperview()
        }
    }
    
    
}
