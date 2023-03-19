//
//  RMCharacterResponse.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 18.03.2023.
//
//
//
import Foundation

class RMCharacterResponse: Codable {
    let info : Info
    let results : [RMCharacter]
}
