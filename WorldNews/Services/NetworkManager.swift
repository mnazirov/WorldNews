//
//  NetworkManager.swift
//  WorldNews
//
//  Created by Marat on 13.03.2021.
//

import UIKit

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchNews(url: String, complition: @escaping (News) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let news = try JSONDecoder().decode(News.self, from: data)
                complition(news)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchImage(url: URL, complition: @escaping (Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error.debugDescription)
                return
            }
            
            guard url == response.url else { return }
            complition(data, response)
        }.resume()
    }
    
    private init() {}
}
