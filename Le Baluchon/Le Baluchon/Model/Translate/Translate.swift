//
//  Translate.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 16/08/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//



import Foundation

// MARK: - Translate
struct Translate: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let translations: [Translation]
}

// MARK: - Translation
struct Translation: Codable {
    let translatedText, model: String
}

