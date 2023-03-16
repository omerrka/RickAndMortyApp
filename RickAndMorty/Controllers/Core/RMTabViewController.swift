//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 16.03.2023.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
      
    }
    
    private func setUpTabs() {
        
        let vc1 = RMRootNavigationController(rootViewController: RMCharacterViewController())
        let vc2 = RMRootNavigationController(rootViewController: RMLocationViewController())
        let vc3 = RMRootNavigationController(rootViewController: RMEpisodeViewController())
        let vc4 = RMRootNavigationController(rootViewController: RMSettingsViewController())
        
        vc1.navigationItem.largeTitleDisplayMode = .automatic
        vc2.navigationItem.largeTitleDisplayMode = .automatic
        vc3.navigationItem.largeTitleDisplayMode = .automatic
        vc4.navigationItem.largeTitleDisplayMode = .automatic
        
        vc1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        vc2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        vc3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        vc4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }
}

