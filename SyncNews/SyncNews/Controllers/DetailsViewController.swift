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
    
    
    
    @IBAction func likedButton(_ sender: UIButton) {
    }
    
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
        
        if let likedNews = UserDefaults.standard.stringArray(forKey: "LikedNews") {
           
            if likedNews.contains(selectedNewsTitle ?? "") {
               
            }
        }
        
        updateLikeButton()
        updateLikeCountLabel()
        
        
        
        
        newsImage.image = selectedNewsImage
    }
    
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        if isLiked {
               // Kullanıcı beğenisini geri çekiyor
               isLiked = false
               
               if var likedNews = UserDefaults.standard.stringArray(forKey: "LikedNews") {
                   // Beğendiği haberlerin içinde seçilen haber var mı?
                   if let index = likedNews.firstIndex(of: selectedNewsTitle ?? "") {
                       likedNews.remove(at: index)
                       UserDefaults.standard.set(likedNews, forKey: "LikedNews")
                   }
               }
               
               likeCount = max(0, likeCount - 1) // En az 0 olacak şekilde azaltma işlemi
            //   likeButton.backgroundColor = .clear // Butonun arka plan rengini temizle (varsayılan renk)
               
           } else {
               // Kullanıcı yeni bir haberi beğeniyor
               isLiked = true
               
               if let likedNews = UserDefaults.standard.stringArray(forKey: "LikedNews") {
                   // Daha önce beğenilen haberler var, seçilen haber zaten var mı?
                   if !likedNews.contains(selectedNewsTitle ?? "") {
                       UserDefaults.standard.set(likedNews + [selectedNewsTitle ?? ""], forKey: "LikedNews")
                   }
               } else {
                   // Daha önce hiç haber beğenilmemiş, yeni bir liste oluştur
                   let likedNews = [selectedNewsTitle ?? ""]
                   UserDefaults.standard.set(likedNews, forKey: "LikedNews")
               }
               
               likeCount += 1 // Beğeni sayacını artırma
            
           }
           
           updateLikeCountLabel()
       }


    func updateLikeButton() {
        let image = isLiked ? UIImage(named: "filledHeart")?.withRenderingMode(.alwaysOriginal) : UIImage(named: "emptyHeart")?.withRenderingMode(.alwaysOriginal)
        likeCountLabel.setImage(image, for: .normal)
    }

    func updateLikeCountLabel() {
        likeCountLabel.setTitle("\(likeCount)", for: .normal)
    }
    
    
    
    
    
    
}
