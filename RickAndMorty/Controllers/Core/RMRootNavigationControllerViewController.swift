//
//  RootNavigationControllerViewController.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 16.03.2023.
//

import UIKit

class RMRootNavigationController: UINavigationController {
    
    let appearance = UINavigationBarAppearance()
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0), .foregroundColor: UIColor.black]
        
        self.navigationBar.tintColor = .black
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance

    }
    

   

}
