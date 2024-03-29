//
//  DetailsViewController.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 12.05.2023.
//

import UIKit
import SyncNewsAPI
import SafariServices

class DetailsViewController: UIViewController,SFSafariViewControllerDelegate {
    
    
    var isLiked = false
    var likeCount = 0
    
    @IBOutlet weak var likeCountLabel: UIButton!
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    @IBAction func likedButton(_ sender: UIButton) {
    }
    
    @IBAction func backButton(_ sender: Any) {
    }
    
    
    var selectedNewsAbstract: String?
    var selectedNewsTitle: String?
    var selectedNewsAuthor:String?
    var selectedNewsURL: URL?
    var selectedNewsImage: UIImage?
    
    @IBAction func detailsSafari(_ sender: UIButton) {
        
        if let url = selectedNewsURL {
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.delegate = self
            present(safariViewController, animated: true, completion: nil)
            
        }
        
        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            dismiss(animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle.text = selectedNewsTitle
        authorLabel.text = selectedNewsAuthor
        detailsLabel.text = selectedNewsAbstract
        
        if let likedNews = UserDefaults.standard.stringArray(forKey: "LikedNews"), likedNews.contains(selectedNewsTitle ?? "") {
            isLiked = true
        }
        
        updateLikeButton()
        
        newsImage.image = selectedNewsImage
        
        if isLiked {
            showAlert(withTitle: "Already Added", message: "This news is already in your favorites.")
        } else {
            showAlert(withTitle: "Removed from Favorites", message: "This news has been removed from your favorites.")
        }
        
        newsImage.image = selectedNewsImage
    }
    
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        if isLiked {
            
            isLiked = false
            
            if var likedNews = UserDefaults.standard.stringArray(forKey: "LikedNews") {
                if let index = likedNews.firstIndex(of: selectedNewsTitle ?? "") {
                    likedNews.remove(at: index)
                    UserDefaults.standard.set(likedNews, forKey: "LikedNews")
                }
            }
            
            likeCount = max(0, likeCount - 1)
            updateLikeButton()
            showAlert(withTitle: "Removed from Favorites", message: "This news has been removed from your favorites.")
        } else {
            
            if let likedNews = UserDefaults.standard.stringArray(forKey: "LikedNews"), likedNews.contains(selectedNewsTitle ?? "") {
                showAlert(withTitle: "Already Added", message: "This news is already in your favorites.")
            } else {
                isLiked = true
                
                if let likedNews = UserDefaults.standard.stringArray(forKey: "LikedNews") {
                    if !likedNews.contains(selectedNewsTitle ?? "") {
                        UserDefaults.standard.set(likedNews + [selectedNewsTitle ?? ""], forKey: "LikedNews")
                    }
                } else {
                    let likedNews = [selectedNewsTitle ?? ""]
                    UserDefaults.standard.set(likedNews, forKey: "LikedNews")
                }
                
                likeCount += 1
                updateLikeButton()
                showAlert(withTitle: "Added to Favorites", message: "This news has been added to your favorites.")
            }
        }
    }
    func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func updateLikeButton() {
        let filledHeartImage = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal)
        let emptyHeartImage = UIImage(systemName: "heart")?.withRenderingMode(.alwaysOriginal)
        let image = isLiked ? filledHeartImage : emptyHeartImage
        likeCountLabel.setImage(image, for: .normal)
    }
}
