//
//  File.swift
//  
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//

import Foundation

public enum Decoders {
    static let dateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
//"yyyy-MM-dd'T'HH:mm:ssZZZZZ"
