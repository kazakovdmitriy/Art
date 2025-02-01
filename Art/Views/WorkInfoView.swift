//
//  WorkInfoView.swift
//  Art
//
//  Created by Дмитрий on 30.01.2025.
//

import SwiftUI

struct WorkInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    private let title: String
    private let imageName: String
    private let info: String
    
    init(title: String, imageName: String, info: String) {
        self.title = title
        self.imageName = imageName
        self.info = info
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 245)
                        .clipped()
                        .alignmentGuide(.top) { _ in 0 }
                    
                    VStack {
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "arrow.backward")
                                    .foregroundStyle(.white)
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.leading, 20)
                            .safeAreaPadding(.top, 58)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    
                }
                
                VStack {
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 16)
                    
                    Text(info)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.mainText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden()
        
        
        NavigationLink(destination: FullImageView(imageName: imageName)) {
            Text("Развернуть")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 46)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    WorkInfoView(
        title: "The Weeping Woman",
        imageName: "Frida4",
        info: "The Weeping Woman, (60 х 49 cm, 23 ⅝ х 19 ¼ inches) is an oil on canvas painted by Pablo Picasso in France in 1937. Picasso was intrigued with the subject, and revisited the theme numerous times that year. This painting was the final and most elaborate of the series. It has been in the collection of the Tate in London since 1987, and is on exhibition at the Tate Modern, London.")
}
