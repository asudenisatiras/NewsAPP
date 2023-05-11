//
//  Feed.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//

import Foundation

public struct NewsR: Decodable {
    public let status: String?
    public let copyright: String?
    public let section: String?
    
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case section
        
    }
}


public struct Welcome: Decodable {
    public let section: String?
    public let title: String?
    public let abstract: String?
    public let byline: String?
    public let publisheddate: String?
    public let url: String?
    
    enum CodingKeys: String, CodingKey {
        case section, title, abstract
        case byline
        case url
        case publisheddate = "published_date"
        
    }
}
