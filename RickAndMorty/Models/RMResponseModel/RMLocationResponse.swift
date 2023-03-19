//
//  RMLocationResponse.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 18.03.2023.
//

import Foundation

class RMLocationResponse: Codable {
    let info : Info
    let results : [RMLocation]
}
