//
//  HomeControllerViewModel.swift
//  iCryptPro
//
//  Created by Intan on 28/09/23.
//

import Foundation
import UIKit

class HomeControllerViewModel {
    var onCoinsUpdated: (()-> Void)?
    var onErrorMessage: ((CoinServiceError)-> Void)?
    
    private(set) var allCoins: [Coin] = [] {
        didSet {
            self.onCoinsUpdated?()
        }
    }
    
    private(set) var filteredCoins: [Coin] = []
    
    init() {
        self.fetchCoins()
    }
    
    public func removeCoin() {
        self.allCoins.remove(at: 0)
    }
    
    public func fetchCoins() {
        let endpoint = Endpoint.fetchCoins()
        
        CoinService.fetchCoins(with: endpoint) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.allCoins = coins
                print("DEBUG PRINT:", "\(coins.count) coin fethced.")
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
}

// MARK: - Search Functions
extension HomeControllerViewModel {
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        return isActive && !searchText.isEmpty
    }
    
    public func updateSearchController(searchBarText: String?) {
        self.filteredCoins = allCoins
        if let searchText = searchBarText?.lowercased() {
            
        }
    }
}
