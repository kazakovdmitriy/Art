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
    private let works: [Work]
    
    init(imageName: String, artistName: String, bio: String, works: [Work]) {
        self.imageName = imageName
        self.artistName = artistName
        self.bio = bio
        self.works = works
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
                
                VStack {
                    Text("Works")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.titleMain)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(works, id: \.title) { work in
                        WorkCardView(
                            title: work.title,
                            imageName: work.image
                        )
                        .padding(.bottom, 26)
//                        .overlay(
//                            NavigationLink(
//                                "",
//                                destination: BiographyView(
//                                    imageName: artist.image,
//                                    artistName: artist.name,
//                                    bio: artist.bio
//                                )
//                            )
//                            .opacity(0)
//                        )
                        .listRowSeparator(.hidden)
                    }
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
        imageName: "3",
        artistName: "Georgia O'Keeffe",
        bio: "Georgia Totto O'Keeffe (November 15, 1887 – March 6, 1986) was an American artist. She is best known for her paintings of enlarged flowers, New York skyscrapers, and New Mexico landscapes. O'Keeffe has been recognized as the 'Mother of American modernism'.",
        works: [
            Work(title: "Lalalla1", image: "Georgia2", info: "Info"),
            Work(title: "Lalalla1", image: "Georgia1", info: "Info"),
        ]
    )
}
