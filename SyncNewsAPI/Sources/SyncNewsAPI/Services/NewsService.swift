//
//  NewsService.swift
//  
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//

import Foundation
import Alamofire

public protocol TopNewsServiceProtocol: AnyObject {
    func fetchTopNews(completion: @escaping (Result<[TopStoriesNews], Error>) -> Void)
    
}

public class TopNewsService: TopNewsServiceProtocol {
    
    public init() {}
    
    
    public func fetchTopNews(completion: @escaping (Result<[TopStoriesNews], Error>) -> Void) {
        
        let urlString = "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=drd83CuzY0DkYcFkO7AUh2naHU6unqMh"
        AF.request(urlString).responseData { response in
            switch response.result {
                
            case .success(let data):
                let decoder = Decoders.dateDecoder
                
                do {
                    let response = try decoder.decode(NewsResponse.self, from: data)
                    completion(.success(response.results))
                }catch {
                    print("***** JSON DECODE ERROR *****")
                }
            case .failure(let error):
                print("***** Geçici bir hata tespit edildi \(error.localizedDescription) ******* ")
            }
        }
        
        
    }
    
    
    
}
