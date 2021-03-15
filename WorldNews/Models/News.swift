//
//  News.swift
//  WorldNews
//
//  Created by Marat on 13.03.2021.
//

import Foundation

struct News: Decodable {
    let news: [Result?]
}

struct Result: Decodable {
    let title: String?
    let description: String?
    let url: String?
    let image: String?
    let author: String?
    let language: String?
    let category: [String]
    let published: String?
}
