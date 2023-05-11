//
//  NewsResponse.swift
//  
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//

import Foundation

public struct NewsResponse: Decodable {
    public let results: [Welcome]
    
    private enum RootCodingKeys: String, CodingKey {
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.results = try container.decode([Welcome].self, forKey: .results)
    }
}
