//
//  LikedViewController.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 17.05.2023.
//

import UIKit
import SafariServices

class LikedViewController: UIViewController, SFSafariViewControllerDelegate{
    

    var likedNews: [String] = []
    @IBOutlet weak var likedTableView: UITableView!
    
    
    @IBOutlet weak var backButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedLikedNews = UserDefaults.standard.stringArray(forKey: "LikedNews") {
                   likedNews = savedLikedNews
            
               }
               
        likedTableView.dataSource = self
        likedTableView.delegate = self
        likedTableView.reloadData()
        
           }
    
    var selectedNewsURL: URL?
    
    
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func goToNews(_ sender: UIButton) {
        
        if let url = selectedNewsURL {  // Modelden çekilen URL'yi kontrol edin
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.delegate = self
            present(safariViewController, animated: true, completion: nil)
            
            
            
        }
        
        
    }
    
    
    }


extension LikedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedNews.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedNewsCell", for: indexPath) as! LikedTableViewCell
        
        let newsTitle = likedNews[indexPath.row]
        cell.authorLabel.text = newsTitle
        
        // Kalp simgesinin görünümünü ayarlayın
       
        
        return cell
    }
    
}
