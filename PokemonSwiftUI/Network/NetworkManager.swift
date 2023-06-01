//
//  NetworkManager.swift
//  PokemonSwiftUI
//
//  Created by Consultant on 3/10/23.
//

import Foundation
import Combine


protocol Networkable {
    func downloadData<T: Decodable>(url: URL, type: T.Type) -> AnyPublisher<T, Error>
}

class NetworkManager : Networkable {
    func downloadData<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
