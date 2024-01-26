//
//  BottomTabBarViewController.swift
//  NetflixClone
//
//  Created by Indrek Mäeots on 25.01.2024.
//

import UIKit

class BottomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let tab1 = UINavigationController(rootViewController: HomeViewController())
        let tab2 = UINavigationController(rootViewController: UpcomingViewController())
        let tab3 = UINavigationController(rootViewController: SearchViewController())
        let tab4 = UINavigationController(rootViewController: DownloadsViewController())
        
        tab1.tabBarItem.image = UIImage(systemName: "house")
        tab2.tabBarItem.image = UIImage(systemName: "hourglass.circle")
        tab3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        tab4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        tab1.title = "Home"
        tab2.title = "Coming Soon"
        tab3.title = "Top Search"
        tab4.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([tab1, tab2, tab3, tab4], animated: true)
    }
}
