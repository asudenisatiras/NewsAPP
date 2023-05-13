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

class ViewController: UIViewController, LoadingShowable {
    
    @IBOutlet weak var newsTableView: UITableView!
    let service: TopNewsServiceProtocol = TopNewsService()
    
    private var news: [Welcome] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetchNews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.register(cellType: NewsTableViewCell.self)
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
                self.newsTableView.reloadData()
            case .failure(let error):
                print("Asude: \(error)")
            }
        }
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
                


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.configure(news: news[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            let selectedNews = news[indexPath.row]
            performSegue(withIdentifier: "nextPageSegue", sender: selectedNews)
        
         
        }
   
    


    }

    

    

    

    

    

    

    
    


