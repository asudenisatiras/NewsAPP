//
//  ViewController.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 10.05.2023.
//

import UIKit
import SyncNewsAPI

class ViewController: UIViewController {
    
    let service: TopNewsServiceProtocol = TopNewsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchTopNews { response in
            
            switch response {
                
            case .success(let data):
                print("asude: \(data)")
            case .failure(let error):
                print("Asude: \(error)")
            }
        }
        
        
    }
    
}
