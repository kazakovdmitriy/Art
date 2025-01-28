//
//  Artist.swift
//  Art
//
//  Created by Дмитрий Казаков on 28.01.2025.
//

import Foundation

// MARK: - Artist
struct Artist: Codable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}
