//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 17.03.2023.
//

import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    
    func fetchAllCharacters(pageNumber: Int, completion: @escaping (Result<RMCharacterResponse, Error>) -> ())

}

class NetworkManager: Networkable {
    
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])

    func fetchAllCharacters(pageNumber: Int, completion: @escaping (Result<RMCharacterResponse, Error>) -> ()) {
        request(target: .characterScreen(pageNumber: pageNumber), completion: completion)
    }
   
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
