//
//  BiographyView.swift
//  Art
//
//  Created by Дмитрий Казаков on 28.01.2025.
//

import SwiftUI

struct BiographyView: View {
    
    @Environment(\.dismiss) var dismiss
    
    private let imageName: String
    private let artistName: String
    private let bio: String
    
    init(imageName: String, artistName: String, bio: String) {
        self.imageName = imageName
        self.artistName = artistName
        self.bio = bio
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 368)
                        .clipped()
                        .alignmentGuide(.top) { _ in 0 }
                    
                    VStack(alignment: .leading) {
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "arrow.backward")
                                .foregroundStyle(.white)
                                .frame(width: 24, height: 24)
                        }
                        
                        Spacer()
                        
                        Text(artistName)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        Text("Artist")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.subtitle2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 26)
                    .padding(.bottom, 24)
                    .safeAreaPadding(.top, 58)
                }
                
                VStack {
                    Text("Biography")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.titleMain)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(bio)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.mainText)
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 24)
                .padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BiographyView(
        imageName: "2",
        artistName: "Pablo Picasso",
        bio: "Pablo Ruiz y Picasso (25 October 1881 – 8 April 1973), also known as Pablo Picasso, was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France. Pablo Ruiz y Picasso (25 October 1881 – 8 April 1973), also known as Pablo Picasso, was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France."
    )
}
