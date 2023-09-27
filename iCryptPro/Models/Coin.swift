//
//  Coin.swift
//  iCryptPro
//
//  Created by Intan on 25/09/23.
//

import Foundation

struct Coin {
    
    let id: Int
    let name: String
    let max_supply: Int?
    let cmc_rank: Int
    let quote: Quote
    
    let logoURL = URL(string: "https://s2.coinmarketcap.com/static/img/coins/200x200/1.png")
    
}

struct Quote {
    let CAD: CAD
}

struct CAD {
    let price: Double
    let market_cap: Double
}

