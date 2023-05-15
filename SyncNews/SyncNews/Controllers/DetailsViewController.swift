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
    
    @IBOutlet weak var likeButton: UILabel!
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    @IBAction func backButton(_ sender: Any) {
    }
    
    
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func detailsSafari(_ sender: UIButton) {
        
        
        if let url = selectedNewsURL {  // Modelden çekilen URL'yi kontrol edin
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.delegate = self
            present(safariViewController, animated: true, completion: nil)
        }
        
        
    }
    
    var selectedNewsAbstract: String?
    var selectedNewsTitle: String?
    var selectedNewsAuthor:String?
    var selectedNewsURL: URL?
    var selectedNewsImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle.text = selectedNewsTitle
        authorLabel.text = selectedNewsAuthor
        detailsLabel.text = selectedNewsAbstract
        // newsImage.image = selectedNewsImage
        if let savedIsLiked = UserDefaults.standard.value(forKey: "IsLiked") as? Bool {
                    isLiked = savedIsLiked
                }
                
                if let savedLikeCount = UserDefaults.standard.value(forKey: "LikeCount") as? Int {
                    likeCount = savedLikeCount
                }
                
                updateLikeButton()
                updateLikeCountLabel()
            
        
        
        
        newsImage.image = selectedNewsImage
    }
    

    @IBAction func likeButtonTapped(_ sender: UIButton) {
        isLiked = !isLiked
                
                if isLiked {
                    likeCount += 1
                } else {
                    likeCount -= 1
                }
                
                updateLikeButton()
                updateLikeCountLabel()
                
                // Beğeni durumunu ve sayısını kaydetmek için tercihlerinize uygun bir yöntem kullanabilirsiniz
                // Örneğin UserDefaults kullanarak kaydedebilirsiniz:
                UserDefaults.standard.set(isLiked, forKey: "IsLiked")
                UserDefaults.standard.set(likeCount, forKey: "LikeCount")
            }
    
    
    func updateLikeButton() {
            let image = isLiked ? UIImage(named: "filledHeart")?.withRenderingMode(.alwaysOriginal) : UIImage(named: "emptyHeart")?.withRenderingMode(.alwaysOriginal)
            likeCountLabel.setImage(image, for: .normal)
        }
        
        func updateLikeCountLabel() {
            likeButton.text = "\(likeCount) Likes"
        }
    }
    
    
    
    
    
    
    
    
    

