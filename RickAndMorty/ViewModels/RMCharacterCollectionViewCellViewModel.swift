//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 17.03.2023.
//

import UIKit

final class RMCharacterCollectionViewCellViewModel {
    
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    public let characterImageUrl: String
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: String
    ) {
        
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
        
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }

    
}
