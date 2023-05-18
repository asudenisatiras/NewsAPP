//
//  LikedViewController.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 17.05.2023.
//

import UIKit
import SafariServices

class LikedViewController: UIViewController, SFSafariViewControllerDelegate, UISearchBarDelegate {
   
    var likedNews: [String] = []
    var isSearching = false
    var filteredNews: [String] = []
    
    @IBOutlet weak var likedTableView: UITableView!
    
    @IBOutlet weak var favoriteSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedLikedNews = UserDefaults.standard.stringArray(forKey: "LikedNews") {
                   likedNews = savedLikedNews
            
               }
        favoriteSearchBar.delegate = self
        likedTableView.dataSource = self
        likedTableView.delegate = self
        likedTableView.reloadData()
        
           }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           if searchText.isEmpty {
               isSearching = false
               filteredNews = likedNews
           } else {
               isSearching = true
               filteredNews = likedNews.filter { newsTitle in
                   return newsTitle.localizedCaseInsensitiveContains(searchText)
               }
           }
        
           likedTableView.reloadData()
       }


    }
    
extension LikedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isSearching ? filteredNews.count : likedNews.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedNewsCell", for: indexPath) as! LikedTableViewCell
                
                let newsTitle = isSearching ? filteredNews[indexPath.row] : likedNews[indexPath.row]
                cell.authorLabel.text = newsTitle
                
                return cell
            }

      
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
              
                let removedNews = likedNews.remove(at: indexPath.row)
                UserDefaults.standard.set(likedNews, forKey: "LikedNews")
                tableView.deleteRows(at: [indexPath], with: .fade)

                showAlert(withTitle: "Removed from Favorites", message: "The news '\(removedNews)' has been removed from your favorites.")
            }
        }
    
    func showAlert(withTitle title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
}
