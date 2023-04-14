//
//  MainTabbarViewController.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 11.04.2023.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        updateTabbarUI()
        selectedIndex = 2
    }
    

}

extension MainTabbarViewController {
    
    func updateTabbarUI() {
        tabBar.tintColor = ColorPalette.white
        tabBar.barTintColor = .clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        let positionX: CGFloat = 24
        let positionY: CGFloat = 8
        let width = tabBar.bounds.width - positionX * 2
        let height: CGFloat = 53
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: positionX,
                                y: tabBar.bounds.minY - positionY,
                                width: width,
                                height: height),
            cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor(red: 0.482, green: 0.38, blue: 1, alpha: 1).cgColor
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 6
        tabBar.itemPositioning = .centered
        tabBar.unselectedItemTintColor = UIColor(red: 0.596, green: 0.62, blue: 0.859, alpha: 1)
    }
    
    func configureViewControllers() {
        viewControllers = [
            prepareViewController(FavoritesViewController(), imageName: "Favorites"),
            prepareViewController(HousesViewController(), imageName: "House"),
            prepareViewController(SearchViewColtroller(), imageName: "Magnifier"),
            prepareViewController(UserViewController(), imageName: "User")
        ]
    }
    
    private func prepareViewController(_ viewController: UIViewController, title: String? = nil, imageName: String) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        return viewController
    }
    
    
}
