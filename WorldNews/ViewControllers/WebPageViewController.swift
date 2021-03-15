//
//  WebPageViewController.swift
//  WorldNews
//
//  Created by Marat on 13.03.2021.
//

import UIKit
import WebKit

class WebPageViewController: UIViewController {

    @IBOutlet var newsWebView: WKWebView!
    
    var news: Result!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = news.title
        guard let url = URL(string: news.url ?? "") else { return }
        let urlRequest = URLRequest(url: url)
        newsWebView.load(urlRequest)
    }
}
