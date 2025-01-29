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
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.border, lineWidth: 3)
                )
                .padding(.horizontal, 2)
                .padding(.bottom, 10)
            
            Text(title)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    WorkCardView(title: "LAlalalala", imageName: "Georgia2")
}
