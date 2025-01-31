//
//  WorkCardView.swift
//  Art
//
//  Created by Дмитрий on 29.01.2025.
//

import SwiftUI

struct WorkCardView: View {
    private let title: String
    private let imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: 150)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                    )
            }
            .frame(height: 150)
            
            Text(title)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    WorkCardView(title: "LAlalalala", imageName: "Georgia3")
}
