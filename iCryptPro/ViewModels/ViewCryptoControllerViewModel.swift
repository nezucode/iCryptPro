//
//  ViewCryptoControllerViewModel.swift
//  iCryptPro
//
//  Created by Intan on 26/09/23.
//

import UIKit

class ViewCryptoControllerViewModel {

    // MARK: - Variables
    let coin: Coin
    
    // MARK: - Initializer
    init(coin: Coin) {
        self.coin = coin
    }
    
    // MARK: - Computed Properties
    var rankLabel: String {
        return "Rank: \(self.coin.cmc_rank)"
    }
    
    var priceLabel: String {
        return "Price: $\(self.coin.quote.CAD.price) CAD"
    }
    
    var marketCapLabel: String {
        return "Market Cap: $\(self.coin.quote.CAD.market_cap) CAD"
    }
    
    var maxSupplyLabel: String {
        
        if let maxSupplyLabel = self.coin.max_supply {
            return "Max Supply: \(maxSupplyLabel)"
        } else {
            return ""
        }
    }
}
