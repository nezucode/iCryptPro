//
//  HomeController.swift
//  iCryptPro
//
//  Created by Intan on 25/09/23.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Variables
    private let coins: [Coin] = [
        Coin(id: 1, name: "Bitcoin", maxSupply: 200, rank: 1, pricingData: PricingData(CAD: CAD(price: 50000, market_cap: 1_000_000))),
        Coin(id: 2, name: "Ethereum", maxSupply: 140, rank: 2, pricingData: PricingData(CAD: CAD(price: 2000, market_cap: 500_000))),
        Coin(id: 3, name: "Monero", maxSupply: nil, rank: 3, pricingData: PricingData(CAD: CAD(price: 1000, market_cap: 250_000)))
    ]
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        return tv
    }()
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.navigationItem.title = "iCryptPro"
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    
    // MARK: - Selectors


}

// MARK: - TableView Functions

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell else {
            fatalError("Unable to dequeue CoinCell in HomeController")
        }
        
        let coin = self.coins[indexPath.row]
        cell.configure(with: coin)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let coin = self.coins[indexPath.row]
        let vm = ViewCryptoControllerViewModel(coin: coin)
        let vc = ViewCryptoController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

