//
//  RMEpisodeResponse.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 18.03.2023.
//

import Foundation

class RMEpisodeResponse: Codable {
    let info : Info
    let results : [RMEpisode]
}
