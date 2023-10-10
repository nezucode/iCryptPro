//
//  ViewCryptoController.swift
//  iCryptPro
//
//  Created by Intan on 25/09/23.
//

import UIKit

class ViewCryptoController: UIViewController {

    // MARK: - Variables
    let viewModel: ViewCryptoControllerViewModel
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let coinLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    private let marketCapLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 500
        return label
    }()
    
    private let maxSupplyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let vs = UIStackView(arrangedSubviews: [rankLabel, priceLabel, priceLabel, marketCapLabel, maxSupplyLabel])
        vs.axis = .vertical
        vs.spacing = 16
        vs.distribution = .fill
        vs.alignment = .center
        vs.translatesAutoresizingMaskIntoConstraints = false
        return vs
    }()
    
    
    
    // MARK: - LifeCycle
    init(_ viewModel: ViewCryptoControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = self.viewModel.coin.name
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        
        self.rankLabel.text = self.viewModel.rankLabel
        self.priceLabel.text = self.viewModel.priceLabel
        self.marketCapLabel.text = self.viewModel.marketCapLabel
        self.maxSupplyLabel.text = self.viewModel.maxSupplyLabel
        self.coinLogo.sd_setImage(with: self.viewModel.coin.logoURL)
        
        
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(coinLogo)
        self.contentView.addSubview(vStack)


//        let height = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
//        height.priority = UILayoutPriority(1)
//        height.isActive = true

        let margins = view.layoutMarginsGuide
        
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true

        
        coinLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        coinLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        coinLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        coinLogo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
      
        vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        vStack.topAnchor.constraint(equalTo: coinLogo.bottomAnchor, constant: 16).isActive = true
        vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        
    }
    
    // MARK: - Selectors


}
