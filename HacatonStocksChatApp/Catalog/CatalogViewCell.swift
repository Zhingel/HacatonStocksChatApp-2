//
//  CatalogViewCell.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import Foundation
import UIKit
class CatalogViewCell: UICollectionViewCell {
    var ticker: TickerElement? {
        didSet {
            tickerName.text = ticker?.name
        }
    }
    let tickerName: UILabel = {
        let label = UILabel()
        return label
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.backgroundColor = .gray
        addSubview(tickerName)
        tickerName.constraints(top: nil, bottom: nil, left: nil, right: nil, paddingTop: 0, paddingBottom: 0, paddingleft: 0, paddingRight: 0, width: 0, height: 0)
        tickerName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tickerName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
