//
//  Beer.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 19/01/23.
//

import Foundation

// MARK: - BeerElement
struct BeerElement: Codable {
    let id: Int
    let firstBrewed: String?
    let name, tagline, description: String
    let imageURL: URL?
    let abv, ibu: Double?
    let targetFg: Double?
    let targetOg: Double?
    let ebc, srm: Double?
    let ph: Double?
    let attenuationLevel: Double?
    let volume: Amount
    let boilVolume: Amount?
    let method: Method?
    let ingredients: Ingredients
    let foodPairing: [String]?
    let brewersTips: String?
    let contributedBy: String?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

// MARK: - BoilVolume
struct Amount: Codable {
    let value: Double?
    let unit: String?
}

// MARK: - Ingredients
struct Ingredients: Codable {
    let malt: [Malt]
    let hops: [Hop]
    let yeast: String?
}

// MARK: - Malt
struct Malt: Codable {
    let name: String
    let amount: Amount
}

// MARK: - Hop
struct Hop: Codable {
    let name: String
    let amount: Amount
    let add: String
    let attribute: String
}

// MARK: - Method
struct Method: Codable {
    let mashTemp: [MashTemp]?
    let fermentation: Fermentation?
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}

// MARK: - Fermentation
struct Fermentation: Codable {
    let temp: Amount?
}

// MARK: - MashTemp
struct MashTemp: Codable {
    let temp: Amount
    let duration: Int?
}

typealias Beer = BeerElement

extension Beer: Identifiable {
}

extension Beer: Hashable {
    static func == (lhs: Beer, rhs: Beer) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


