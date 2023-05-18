//
//  Feed.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//

public struct TopStoriesNews: Decodable {
    public let section: String?
    public let title: String?
    public let abstract: String?
    public let byline: String?
    public let publisheddate: String?
    public let url: String?
    public let multimedia: [Multimedia]?
  
    enum CodingKeys: String, CodingKey {
        case section, title, abstract
        case byline
        case url
        case publisheddate = "published_date"
        case multimedia = "multimedia"
    }
}

public struct Multimedia: Codable {
   public let url: String?
    public let format: String?
    public let type, subtype, caption, copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case url,format,type,subtype, caption, copyright
        
    }
}

