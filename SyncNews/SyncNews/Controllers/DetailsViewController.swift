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
    
   
   
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
   
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle.text = selectedNewsTitle
        authorLabel.text = selectedNewsAuthor
        detailsLabel.text = selectedNewsAbstract
    }
   

    

}
