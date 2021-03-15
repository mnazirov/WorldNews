//
//  NewsTableViewCell.swift
//  WorldNews
//
//  Created by Marat on 14.03.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sourseLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var coverImageView: NewsImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = .black
        }
    }
    
    func content(news: Result?) {
        titleLabel.text = news?.title ?? ""
        sourseLabel.text = "👨‍💻 \(news?.author ?? "Unknown")"
        categoryLabel.text = news?.category.first ?? ""
        coverImageView.fetchImage(url: news?.image ?? "")
    }

}
