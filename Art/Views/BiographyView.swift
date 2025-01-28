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
    
    init(imageName: String, artistName: String) {
        self.imageName = imageName
        self.artistName = artistName
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
                
                Text("Biography")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.titleMain)
                    .padding(.top, 24)
                    .padding(.leading, 26)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BiographyView(imageName: "0", artistName: "Pablo Picasso")
}
