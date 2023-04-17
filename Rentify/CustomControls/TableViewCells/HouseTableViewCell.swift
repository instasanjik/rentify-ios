//
//  HouseTableViewCell.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 14.04.2023.
//

import UIKit
import SnapKit


class HouseTableViewCell: UITableViewCell {
    
    static let id = "HouseViewTableViewCell"
    
    lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return collectionView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 1,000 per month"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var descrioptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.482, green: 0.38, blue: 1, alpha: 1)
        label.text = "3-room apartment, 120 sq., 4/10 floor"
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Saken Seifullin st., - Republic Avenue, HC Vernyy"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Astana, Esil area"
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton()
        button.setTitle("Call", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 0.482, green: 0.38, blue: 1, alpha: 1)
        return button
    }()
    
    lazy var chatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Chat", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.902, green: 0.922, blue: 0.945, alpha: 1).cgColor
        button.clipsToBounds = true
        button.backgroundColor = .white
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        backgroundColor = .white
        setupCollectionView()
        setupPriceLabel()
        setupDescriptionLabel()
        setupAddressLabel()
        setupCityLabel()
        setupCallButton()
        setupChatButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

    
}

extension HouseTableViewCell {
    
    fileprivate func setupCollectionView() {
        addSubview(photosCollectionView)
        photosCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
    }
    
    fileprivate func setupPriceLabel() {
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(photosCollectionView.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview()
            make.height.equalTo(24)
        }
    }
    
    fileprivate func setupDescriptionLabel() {
        addSubview(descrioptionLabel)
        descrioptionLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.left.equalTo(priceLabel)
            make.right.equalToSuperview()
            make.height.equalTo(16)
        }
    }
    
    fileprivate func setupAddressLabel() {
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(descrioptionLabel.snp.bottom).offset(8)
            make.left.equalTo(priceLabel)
            make.right.equalToSuperview()
            make.height.equalTo(16)
        }
    }
    
    fileprivate func setupCityLabel() {
        addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom)
            make.left.equalTo(priceLabel)
            make.right.equalToSuperview()
            make.height.equalTo(16)
        }
    }
    
    fileprivate func setupCallButton() {
        addSubview(callButton)
        callButton.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(14)
            make.left.equalTo(priceLabel)
            make.width.equalTo((Screen.width-48-24)/9*4)
            make.height.equalTo(40)
        }
    }
    
    fileprivate func setupChatButton() {
        addSubview(chatButton)
        chatButton.snp.makeConstraints { make in
            make.top.equalTo(callButton)
            make.left.equalTo(callButton.snp.right).offset(12)
            make.width.equalTo((Screen.width-48-24)/9*4)
            make.height.equalTo(40)
        }
    }
    
    
}

extension HouseTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath)
        let imageView = UIImageView(image: UIImage(named: "house"))
        cell.addSubview(imageView)
        cell.layer.cornerRadius = 4
        cell.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 193, height: 120)
    }
    
    
}

class PhotoCollectionViewCell: UICollectionViewCell {
    
}
