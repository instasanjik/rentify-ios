//
//  HouseViewController.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 14.04.2023.
//

import UIKit
import SnapKit

class HouseViewController: UIViewController {
    
    var imageHeightConstraint: NSLayoutConstraint?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = UIEdgeInsets(top: headerView.bounds.height, left: 0, bottom: 0, right: 0)
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: Screen.width, height: Screen.height + 100)
//        scrollView.addObserver(self, forKeyPath: "contentOffset", options: [.new], context: nil)
        return scrollView
    }()
    
    lazy var containerView = UIView()
    lazy var headerView = UIView()
    lazy var contentView = UIView()
    
    var contentHeight: Double = 0 {
        didSet {
            scrollView.contentSize = CGSize(width: Screen.width, height: contentHeight)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
    }
    

}

extension HouseViewController {
    
    fileprivate func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "house")
        scrollView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 200)
        imageHeightConstraint!.isActive = true
    }
    
    
}

extension HouseViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let newHeight = max(200 - offsetY, 100)
        imageHeightConstraint!.constant = newHeight
    }
    
    
}
