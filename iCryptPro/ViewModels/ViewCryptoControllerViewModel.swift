//
//  ViewCryptoControllerViewModel.swift
//  iCryptPro
//
//  Created by Intan on 26/09/23.
//

import Foundation
import UIKit

class ViewCryptoControllerViewModel {
    
    var onImageLoaded: ((UIImage?)->Void)?
    
    // MARK: - Variables
    let coin: Coin
    
    // MARK: - Initializer
    init(coin: Coin) {
        self.coin = coin
        self.loadImage()
    }
    
    private func loadImage() {
        DispatchQueue.global().async { [weak self] in
            if let logoURL = self?.coin.logoURL,
               let imageData = try? Data(contentsOf: logoURL),
               let logoImage = UIImage(data: imageData) {
                self?.onImageLoaded?(logoImage)
            }
        }
    }
    
    // MARK: - Computed Properties
    var rankLabel: String {
        return "Rank: \(self.coin.rank)"
    }
    
    var priceLabel: String {
        return "Price: $\(self.coin.pricingData.CAD.price) CAD"
    }
    
    var marketCapLabel: String {
        return "Market Cap: $\(self.coin.pricingData.CAD.market_cap) CAD"
    }
    
    var maxSupplyLabel: String {
        
        if let maxSupplyLabel = self.coin.maxSupply {
            return "Max Supply: \(maxSupplyLabel)"
        } else {
            return "123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123"
        }
    }
}
