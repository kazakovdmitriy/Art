//
//  ArtistsView.swift
//  Art
//
//  Created by Дмитрий Казаков on 28.01.2025.
//

import SwiftUI

struct ArtistsView: View {
    
    @StateObject private var viewModel: ArtistsViewModel = ArtistsViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            
            List {
                if viewModel.isLoading {
                    ProgressView()
                }
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                ForEach(viewModel.artists, id: \.name) { artist in
                    ArtistCardView(
                        imageName: artist.image,
                        name: artist.name,
                        bio: artist.bio
                    )
                    .onTapGesture {
                        print("Tapped on \(artist.name)")
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .searchable(text: $searchText, prompt: "Search")
            .listStyle(PlainListStyle())
            .navigationTitle("Artists")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Действие кнопки
                    }) {
                        Text("+")
                    }
                }
            }
            .onAppear {
                viewModel.loadArtists()
            }
        }
    }
}

#Preview {
    ArtistsView()
}
