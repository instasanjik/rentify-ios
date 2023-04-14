//
//  LandlordsCollectionViewCell.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 14.04.2023.
//

import UIKit
import SnapKit


class LandlordsCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.image = UIImage(named: "landlord")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var ratingView = StarRatingView()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.text = "William Lawson"
        return label
    }()
    
    lazy var offersLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.text = "126 offers"
        return label
    }()
    
    lazy var arrowImageView: UIImageView = {
        return UIImageView(image: UIImage(systemName: "arrow.right"))
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backgroundColor = UIColor(red: 0.482, green: 0.38, blue: 1, alpha: 1)
        layer.cornerRadius = 12
        setupImageView()
        setupRatingMenu()
        setupNameLabel()
        setupOffersLabel()
        setupArrowImageView()
    }
    
    
}

extension LandlordsCollectionViewCell {
    
    fileprivate func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(8)
            make.height.width.equalTo(44)
        }
    }
    
    fileprivate func setupRatingMenu() {
        addSubview(ratingView)
        ratingView.rating = 4
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(3)
            make.left.equalTo(imageView)
            make.height.equalTo(12)
            make.width.equalTo(ratingView.snp.height).multipliedBy(5)
        }
    }
    
    fileprivate func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView)
            make.top.equalTo(ratingView.snp.bottom).offset(6)
            make.height.equalTo(16)
        }
    }
    
    
    fileprivate func setupOffersLabel() {
        addSubview(offersLabel)
        offersLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView)
            make.top.equalTo(nameLabel.snp.bottom)
            make.height.equalTo(16)
        }
    }
    
    fileprivate func setupArrowImageView() {
        addSubview(arrowImageView)
        arrowImageView.tintColor = .white
        arrowImageView.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().offset(-8)
            make.top.equalTo(offersLabel)
            make.width.equalTo(10)
        }
    }
    
    
    
}

