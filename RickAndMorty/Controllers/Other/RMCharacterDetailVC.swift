//
//  RMCharacterDetailVC.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 18.03.2023.
//

import UIKit

final class RMCharacterDetailVC: UIViewController {
    
    private let viewModel: RMCharacterDetailViewVM
    
    init(viewModel: RMCharacterDetailViewVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title

    }
}
