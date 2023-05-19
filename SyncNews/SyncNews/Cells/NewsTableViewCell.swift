//
//  NewsTableViewCell.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//

import UIKit
import SyncNewsAPI
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    
    @IBOutlet weak var abstractLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(news: TopStoriesNews){
        preparePosterImage(with: news.multimedia?[0].url)
        newsTitleLabel.text = news.title
        authorLabel.text = news.byline
        publishedDateLabel.text = news.section
        abstractLabel.text = news.abstract
        
    }
    
    
    private func preparePosterImage(with urlString: String?){
        
        //let fullPath = "https://static01.nyt.com/images/2023/05/11/multimedia/\(urlString ?? "")"
        
        if let urlString = urlString, let url = URL(string: urlString) {
            newsImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        }
        
    }
    
    public func search(for searchText: String) -> Bool {
        guard let authorText = authorLabel.text else { return false }
        return authorText.localizedCaseInsensitiveContains(searchText)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
