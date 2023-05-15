//
//  ViewController.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 10.05.2023.
//

import UIKit
import SyncNewsAPI


var news = [Welcome]()
var title : Welcome?

class ViewController: UIViewController, LoadingShowable,UISearchBarDelegate {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    @IBOutlet weak var searchButton: UISearchBar!
    let service: TopNewsServiceProtocol = TopNewsService()
    private var filteredNews: [Welcome] = []
    private var news: [Welcome] = []
    private var isSearchResultEmpty: Bool = false

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetchNews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.register(cellType: NewsTableViewCell.self)
        searchButton.delegate = self
        fetchNews()
        
        
    }
    
    fileprivate func fetchNews() {
        
        self.showLoading()
        
        service.fetchTopNews { [weak self] response in
            guard let self else { return }
            self.hideLoading()
            switch response {
                
            case .success(let news):
                print("asude: \(news)")
                self.news = news
                self.filteredNews = news
                self.newsTableView.reloadData()
            case .failure(let error):
                print("Asude: \(error)")
            }
        }
    }
    func searchNews(with searchText: String) {
        if searchText.isEmpty {
            filteredNews = news
        } else {
            filteredNews = news.filter { $0.title?.range(of: searchText, options: [.caseInsensitive, .diacriticInsensitive]) != nil }
        }
        
        isSearchResultEmpty = filteredNews.isEmpty
        newsTableView.reloadData()
    }

      
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          searchNews(with: searchText)
      }
      
      func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          searchBar.resignFirstResponder() // Klavyeyi kapat
      }

            }

              


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchResultEmpty {
                return 1 // Bulunamadı hücresi için 1 satır
            } else {
                return filteredNews.count
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearchResultEmpty {
               let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
               
               let noResultsImage = UIImage(named: "NoResultFound")
               let imageView = UIImageView(image: noResultsImage)
               
            imageView.contentMode = .scaleToFill
               imageView.translatesAutoresizingMaskIntoConstraints = false
               
               cell.contentView.addSubview(imageView)
               
               NSLayoutConstraint.activate([
                   imageView.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
                   imageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                   imageView.widthAnchor.constraint(equalToConstant: 200),
                   imageView.heightAnchor.constraint(equalToConstant: 200)
               ])
               
               return cell
           } else {
               let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
               cell.configure(news: filteredNews[indexPath.row])
               return cell
           }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let selectedNews = filteredNews[indexPath.row] // Filtrelenmiş haberlerden seçileni al
                performSegue(withIdentifier: "nextPageSegue", sender: selectedNews)
        
         
        }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextPageSegue" {
            if let nextViewController = segue.destination as? DetailsViewController,
               let selectedNews = sender as? Welcome {
                nextViewController.selectedNewsTitle = selectedNews.title
                nextViewController.selectedNewsAuthor = selectedNews.byline
                nextViewController.selectedNewsAbstract = selectedNews.abstract
                nextViewController.selectedNewsURL = URL(string: selectedNews.url!)
                if let multimedia = selectedNews.multimedia?.first,
                let imageURL = URL(string: multimedia.url!),
                let imageData = try? Data(contentsOf: imageURL),
                let newsImage = UIImage(data: imageData) {
                nextViewController.selectedNewsImage = newsImage
                            }
                        }
                    }
            }
    }

    

    

    

    

    

    

    
    


