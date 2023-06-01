//
//  ViewModel.swift
//  PokemonSwiftUI
//
//  Created by Consultant on 3/10/23.
//

import Foundation
import Combine

class ViewModel : ObservableObject {
    
    @Published var pokemons = [Datum]()
    var networkManager: Networkable
    
    private var cancellable = Set<AnyCancellable>()
    
    init(networkManager: Networkable){
        self.networkManager = networkManager
    }
    
    func getPokemonData(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        networkManager.downloadData(url: url, type: Pokemon.self)
            .receive(on: OperationQueue.main)
            .sink { aaa in
                 
            } receiveValue: { pokemon in
                print(pokemon)
                self.pokemons = pokemon.data
            }
            .store(in: &cancellable)
    }
    
    
    
    
}
