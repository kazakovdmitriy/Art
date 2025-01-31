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
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 368)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                        }
                        
                        Spacer()
                        
                        Text(artistName)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        Text("Artist")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 26)
                    .padding(.bottom, 24)
                    .padding(.top, 78)
                }
                .frame(height: 368)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Biography")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Text(bio)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.gray)
                    
                    Text("Works")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                    
                    ForEach(works, id: \.title) { work in
                        NavigationLink(destination: WorkInfoView(title: work.title, imageName: work.image, info: work.info)) {
                            WorkCardView(title: work.title, imageName: work.image)
                        }
                        .padding(.bottom, 26)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
            }
        }
        .edgesIgnoringSafeArea(.top)
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
