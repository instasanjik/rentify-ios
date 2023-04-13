//
//  DiscoverCollectionViewCell.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 13.04.2023.
//

import UIKit
import SnapKit


class DiscoverCollectionViewCell: UICollectionViewCell {
    
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
        label.text = "Hot this year"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Astana"
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 0.546, green: 0.546, blue: 0.546, alpha: 1)
        label.text = "$1,200"
        return label
    }()
    
    lazy var starsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    lazy var starsLabel: UILabel = {
        let label = UILabel()
        label.text = "5.0"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var starsImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star"))
        return imageView
    }()
    
    lazy var personsLabel: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1)
        return label
    }()
    
    lazy var personsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "users")
        return imageView
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
        setupCityNameLabel()
        setupPriceLabel()
        setupRatingMenu()
        setupPersonsMenu()
    }
    
    
}

extension DiscoverCollectionViewCell {
    
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
            make.left.top.equalToSuperview().inset(7)
            make.height.equalTo(18)
            make.width.greaterThanOrEqualTo(18)
        }
        
        specialTextSubstrateView.addSubview(specialTextLabel)
        specialTextLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(6)
            make.center.equalToSuperview()
        }
    }
    
    fileprivate func setupCityNameLabel() {
        addSubview(cityNameLabel)
        cityNameLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom).offset(4)
        }
    }
    
    fileprivate func setupPriceLabel() {
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.width.left.equalTo(cityNameLabel)
            make.top.equalTo(cityNameLabel.snp.bottom).offset(4)
        }
    }
    
    fileprivate func setupRatingMenu() {
        addSubview(starsView)
        starsView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalTo(cityNameLabel)
            make.height.equalTo(19)
            make.width.greaterThanOrEqualTo(6)
        }
        let stackView = UIStackView()
        stackView.addArrangedSubview(starsImageView)
        starsImageView.snp.makeConstraints { make in
            make.width.equalTo(starsImageView.snp.height)
        }
        stackView.addArrangedSubview(starsLabel)
        stackView.spacing = 4
        
        starsView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.top.right.bottom.equalToSuperview().inset(3)
        }
    }
    
    fileprivate func setupPersonsMenu() {
        addSubview(personsImageView)
        personsImageView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalTo(starsView.snp.bottom).offset(4)
            make.height.equalTo(personsImageView.snp.width)
        }
        
        addSubview(personsLabel)
        personsLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(personsImageView)
            make.right.equalTo(personsImageView.snp.left).inset(-4)
        }
    }
    
    
}
