//
//  Translate.swift
//  Le Baluchon
//
//  Created by Adam Mabrouki on 16/08/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//



import Foundation

// MARK: - Translate
struct Translate: Decodable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let translations: [Translation]
}

// MARK: - Translation
struct Translation: Decodable {
    let translatedText, model: String
}

