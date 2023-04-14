//
//  StarRatingView.swift
//  Rentify
//
//  Created by Sanzhar Koshkarbayev on 14.04.2023.
//

import UIKit

class StarRatingView: UIView {
    
    var rating: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var maxRating: Int = 5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var filledStarImage: UIImage? = UIImage(named: "star") {
        didSet {
            setNeedsLayout()
        }
    }
    
    var emptyStarImage: UIImage? = UIImage(named: "star_off") {
        didSet {
            setNeedsLayout()
        }
    }
    
    private var starImageViews: [UIImageView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStarImageViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStarImageViews()
    }
    
    private func setupStarImageViews() {
        for _ in 0..<maxRating {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            addSubview(imageView)
            starImageViews.append(imageView)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !starImageViews.isEmpty else {
            return
        }
        
        let starSize = CGSize(width: bounds.height, height: bounds.height)
        let spacing = bounds.width / CGFloat(maxRating)
        
        for (index, imageView) in starImageViews.enumerated() {
            let origin = CGPoint(x: CGFloat(index) * spacing, y: 0)
            imageView.frame = CGRect(origin: origin, size: starSize)
            
            if index < rating {
                imageView.image = filledStarImage
            } else {
                imageView.image = emptyStarImage
            }
        }
    }
}
