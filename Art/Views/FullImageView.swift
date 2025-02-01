//
//  FullImageView.swift
//  Art
//
//  Created by Дмитрий on 01.02.2025.
//

import SwiftUI

struct FullImageView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var scale: CGFloat = 1.0
    @State private var lastScaleValue: CGFloat = 1.0
    var imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ScrollView([.vertical, .horizontal]) {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(scale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    self.scale = (self.lastScaleValue - 1) * value + 1
                                }
                                .onEnded { value in
                                    self.lastScaleValue = self.scale
                                }
                        )
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                dismiss()
            }){
                ZStack {
                    Circle()
                        .fill(.white)
                        .stroke(.closeButton, lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "xmark")
                        .foregroundStyle(.closeButton)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FullImageView(imageName: "Georgia1")
}
