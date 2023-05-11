//
//  Feed.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status, copyright, section: String
    let lastUpdated: Date
    let numResults: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let section: Section
    let subsection: Subsection
    let title, abstract: String
    let url: String
    let uri, byline: String
    let itemType: ItemType
    let updatedDate, createdDate, publishedDate: Date
    let materialTypeFacet: String
    let kicker: Kicker
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let multimedia: [Multimedia]
    let shortURL: String

    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, uri, byline
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia
        case shortURL = "short_url"
    }
}

enum ItemType: String, Codable {
    case article = "Article"
}

enum Kicker: String, Codable {
    case artistSQuestionnaire = "Artist’s Questionnaire"
    case criticSNotebook = "Critic’s Notebook"
    case criticSPick = "Critic’s Pick"
    case criticsNotebook = "Critics’ Notebook"
    case empty = ""
    case reporterSNotebook = "Reporter’s Notebook"
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let url: String
    let format: Format
    let height, width: Int
    let type: TypeEnum
    let subtype: Subtype
    let caption, copyright: String
}

enum Format: String, Codable {
    case largeThumbnail = "Large Thumbnail"
    case superJumbo = "Super Jumbo"
    case threeByTwoSmallAt2X = "threeByTwoSmallAt2X"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum TypeEnum: String, Codable {
    case image = "image"
}

enum Section: String, Codable {
    case arts = "arts"
    case business = "business"
    case fashion = "fashion"
    case movies = "movies"
    case tMagazine = "t-magazine"
    case theater = "theater"
}

enum Subsection: String, Codable {
    case dance = "dance"
    case design = "design"
    case empty = ""
    case music = "music"
    case television = "television"
}
