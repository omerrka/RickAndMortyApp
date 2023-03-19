//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 16.03.2023.
//

import Foundation

enum RMCharacterStatus : String, Codable {
    
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
