//
//  RMCharacterDetailViewVM.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 18.03.2023.
//

import Foundation

final class RMCharacterDetailViewVM {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
}
