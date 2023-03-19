//
//  RMAPI.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 17.03.2023.
//


import Moya


enum API {
    
    case characterScreen(pageNumber: Int)
    
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://rickandmortyapi.com/api") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .characterScreen:
            return "character"
        }
    }
    
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        
        switch self {
        case .characterScreen(let pageNumber):
            return .requestParameters(parameters: ["page": pageNumber], encoding: URLEncoding.default)

        }
    }
    
    var headers: [String : String]? {
//        return ["Content-type": "application/json"]
        return nil
    }
}
