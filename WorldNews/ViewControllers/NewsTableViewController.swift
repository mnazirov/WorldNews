//
//  NewsTableViewController.swift
//  WorldNews
//
//  Created by Marat on 13.03.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 170
        getNews()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news?.news.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        let currentNews = news?.news[indexPath.row]
        
        cell.content(news: currentNews)
        cell.selectedBackgroundView = setSelectColor(red: 0.07, green: 0.07, blue: 0.07)
        
        return cell
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let webPageVC = segue.destination as? WebPageViewController else { return }
        guard let index = tableView.indexPathForSelectedRow?.row else { return }
        webPageVC.news = news?.news[index]
    }
    
    @IBAction func reloadDataPressedButton(_ sender: UIBarButtonItem) {
        getNews()
    }
    
    private func getNews() {
        NetworkManager.shared.fetchNews(url: "https://api.currentsapi.services/v1/latest-news?apiKey=4zw5zfgNcS96VnJowzxs23XqR-HyfDufZwmVh8C3fcFDlqa2") { news in
            self.news = news
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setSelectColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIView {
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return bgColorView
    }
}
