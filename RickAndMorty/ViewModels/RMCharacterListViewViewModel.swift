//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 17.03.2023.
//

import UIKit

protocol RMCharacterViewVMDelegate: AnyObject {
    func reloadCollectionView()
    func didSelectCharacter(_ character: RMCharacter)
    
}

final class RMCharacterListViewViewModel: NSObject {
    
    var fetchingMore = false
    var pageNumber = 1
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters where !cellViewModels.contains(where: {$0.characterName == character.name}) {
                let viewModel = RMCharacterCollectionViewCellViewModel(characterName: character.name, characterStatus: character.status, characterImageUrl: character.image)
                cellViewModels.append(viewModel)
            }
        }
    }
    
    public weak var delegate: RMCharacterViewVMDelegate?
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    public func fetchCharacters() {
        
        self.fetchingMore = true
        networkManager.fetchAllCharacters(pageNumber: pageNumber, completion: { [weak self] result in
            
            guard let strongSelf = self else { return }
            switch result {
            case .success(let allCharacters):
                if self?.pageNumber == 1 {
                    strongSelf.characters = allCharacters.results
                    strongSelf.delegate?.reloadCollectionView()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self?.characters.append(contentsOf: allCharacters.results)
                    self?.fetchingMore = false
                    self?.delegate?.reloadCollectionView()
                })
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        pageNumber += 1
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel) 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width,
            height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if contentHeight > 0 {
            if offsetY > contentHeight - scrollView.frame.height {
                if !fetchingMore {
                    fetchCharacters()
                    if !fetchingMore {
                        fetchCharacters()
                    }
                }
            }
        }
    }
}
