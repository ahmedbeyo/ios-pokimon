//
//  ContentView.swift
//  PokemonSwiftUI
//
//  Created by Consultant on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    @StateObject var viewModel = ViewModel(networkManager: NetworkManager())
    
    @State var searchItem = ""
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())], spacing: 10) {
                        ForEach(viewModel.pokemons) { pokemon in
                            VStack{
                                AsyncImage(url: URL(string: pokemon.images.small)){ image in
                                    image.resizable().aspectRatio(contentMode: .fit)
                                }placeholder: {
                                    ProgressView()
                                }.frame(width: 100, height: 150)
                                    .padding()
                                NavigationLink {
                                    DetailView(image: pokemon.images.small, name: pokemon.name)
                                } label: {
                                    Text(pokemon.name)
                                }
                            }
                            .refreshable {
                                print("Refreshed!")
                            }
                            .searchable(text: $searchItem, prompt: "Look for your Pokemon!")
                        }
                    }
                }
            }
            .onAppear{
                viewModel.getPokemonData(urlString: "https://api.pokemontcg.io/v2/cards?page=1&pageSize=50")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
