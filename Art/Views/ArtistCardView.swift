//
//  ArtistCardView.swift
//  Art
//
//  Created by Дмитрий Казаков on 28.01.2025.
//

import SwiftUI

struct ArtistCardView: View {
    
    private var imageName: String
    private var name: String
    private var bio: String
    
    init(imageName: String, name: String, bio: String) {
        self.imageName = imageName
        self.name = name
        self.bio = bio
    }
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 96, height: 96)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack {
                Text(name)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.subtitle1)
                    .frame(width: 224, height: 20, alignment: .leading)
                
                Text(bio)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.titleMain)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .frame(width: 224, height: 48, alignment: .leading)
            }
            .padding(.leading, 8)
        }
    }
}

#Preview {
    
    var imageName: String = "0"
    var name: String = "Pablo Picasso"
    var bio: String = "Pablo Ruiz y Picasso (25 October 1881 - 8 April 1973) was a Spanish painter, sculptor, printmaker, ceramicist and theatre designer who spent most of his adult life in France."
    
    ArtistCardView(
        imageName: imageName,
        name: name,
        bio: bio)
}
