//
//  Coin.swift
//  iCryptPro
//
//  Created by Intan on 25/09/23.
//

import Foundation

struct CoinArray: Codable {
    let data: [Coin]
}

struct Coin: Codable {
    
    let id: Int
    let name: String
    let maxSupply: Int?
    let rank: Int
    let pricingData: PricingData
    
    var logoURL: URL? {
        return URL(string: "https://s2.coinmarketcap.com/static/img/coins/200x200/\(id).png")
    }
    
    enum Codingkeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case maxSupply = "max_supply"
        case rank = "cmc_rank"
        case pricingData = "quote"
    }
    
}

struct PricingData: Codable {
    let CAD: CAD
}

struct CAD: Codable {
    let price: Double
    let market_cap: Double
}

