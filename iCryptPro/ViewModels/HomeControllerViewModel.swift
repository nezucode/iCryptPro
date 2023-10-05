//
//  HomeControllerViewModel.swift
//  iCryptPro
//
//  Created by Intan on 28/09/23.
//

import Foundation

class HomeControllerViewModel {
    var onCoinsUpdated: (()-> Void)?
    var onErrorMessage: ((CoinServiceError)-> Void)?
    
    private(set) var coins: [Coin] = [] {
        didSet {
            self.onCoinsUpdated?()
        }
    }
    
    init() {
        self.fetchCoins()
    }
    
//    public func removeCoin() {
//        self.coins.remove(at: 0)
//    }
    
    public func fetchCoins() {
        let endpoint = Endpoint.fetchCoins()
        
        CoinService.fetchCoins(with: endpoint) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coins = coins
                print("DEBUG PRINT:", "\(coins.count) coin fethced.")
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
}
