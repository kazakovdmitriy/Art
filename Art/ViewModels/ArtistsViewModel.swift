//
//  ArtistsViewModel.swift
//  Art
//
//  Created by Дмитрий Казаков on 28.01.2025.
//

import Foundation
import SwiftUI

final class ArtistsViewModel: ObservableObject {
    
    @Published var artists: [Artist] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func loadArtists() {
        isLoading = true
        errorMessage = nil
        
        if let artistsResponse = JSONService.readJSONFromFile(filename: "data", as: Artists.self) {
            artists = artistsResponse.artists
        } else {
            errorMessage = "Не удалось загрузить данные"
        }
        
        isLoading = false
    }
}
