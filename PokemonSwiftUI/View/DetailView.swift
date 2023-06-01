//
//  DetailView.swift
//  PokemonSwiftUI
//
//  Created by Consultant on 3/10/23.
//

import SwiftUI

struct DetailView: View {
    
    var image: String
    var name: String
    
    var body: some View {
        AsyncImage(url: URL(string: image)){ image in
            image.resizable().aspectRatio(contentMode: .fit)
        }placeholder: {
            ProgressView()
        }.frame(width: 250, height: 300)
            .padding()
        Text(name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "", name: "")
    }
}
