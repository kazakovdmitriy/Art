//
//  JSONService.swift
//  Art
//
//  Created by Дмитрий Казаков on 28.01.2025.
//

import Foundation

final class JSONService {
    
    static let shared = JSONService()
    
    private init() {}
    
    static func readJSONFromFile<T: Decodable>(filename: String, as type: T.Type) -> T? {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(type, from: data)
                return jsonData
            } catch {
                print("Ошибка при чтении JSON файла: \(error)")
            }
        } else {
            print("Файл не найден")
        }
        return nil
    }
}
