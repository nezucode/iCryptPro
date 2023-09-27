//
//  CoinCell.swift
//  iCryptPro
//
//  Created by Intan on 25/09/23.
//

import UIKit

class CoinCell: UITableViewCell {
    static let identifier = "CoinCell"
    
    // MARK: - Variables
    private(set) var coin: Coin!
    
    // MARK: - UI Components
    private let coinLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .black
        return iv
    }()
    
    private let coinName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with coin: Coin) {
        self.coin = coin
        
        self.coinName.text = coin.name
        
        guard let url = self.coin.logoURL else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let imageData = data else { return }

            DispatchQueue.main.async { [weak self] in
            self?.coinLogo.image = UIImage(data: imageData)
            }
        }
        dataTask.resume()
        
        
//        let imageData = try? Data(contentsOf: self.coin.logoURL!)
//
//        if let imageData = imageData {
//            DispatchQueue.main.async { [weak self] in
//                self?.coinLogo.image = UIImage(data: imageData)
//            }
//        }
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.addSubview(coinLogo)
        self.addSubview(coinName)
        
        coinLogo.translatesAutoresizingMaskIntoConstraints = false
        coinName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinLogo.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            coinLogo.heightAnchor.constraint(equalToConstant: 50),
            coinLogo.widthAnchor.constraint(equalToConstant: 50),
            
            coinName.leadingAnchor.constraint(equalTo: coinLogo.trailingAnchor, constant: 12),
            coinName.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
