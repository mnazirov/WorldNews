//
//  newsImageView.swift
//  WorldNews
//
//  Created by Marat on 13.03.2021.
//

import UIKit

class NewsImageView: UIImageView {
    func fetchImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            image = #imageLiteral(resourceName: "picture")
            return
        }
        
        if let cachedImage = getCachedImage(from: imageURL) {
            image = cachedImage
            return
        }
        
        NetworkManager.shared.fetchImage(url: imageURL) { (data, response) in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            self.saveDataToCache(data: data, response: response)
        }
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let imageRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: imageRequest) {
            return UIImage(data: cachedResponse.data)
        }
        
        return nil
    }
    
    private func saveDataToCache(data: Data, response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
}

