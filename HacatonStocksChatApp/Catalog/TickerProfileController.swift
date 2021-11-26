//
//  TickerProfileController.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import Foundation
import UIKit
class TickerProfileController: UIViewController {
    var tickerInfo: TickerInfoElement?
    var tickerName: String?
    var flag = false
    let tickerNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tickerNameLabel)
        tickerNameLabel.constraints(top: nil, bottom: nil, left: nil, right: nil, paddingTop: 0, paddingBottom: 0, paddingleft: 0, paddingRight: 0, width: 0, height: 0)
        tickerNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tickerNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        navigationItem.title = tickerInfo?.companyName
        self.tickerNameLabel.text = self.tickerInfo?.companyName
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        print(tickerInfo)
    }
    override func viewDidAppear(_ animated: Bool) {
        print("fff")
        
    }
    fileprivate func fetchData() {
        let fetchData = FetchData()
        DispatchQueue.main.async {
            guard let tickerName = self.tickerName else {
                return
            }
            fetchData.fetchDataStockInfo(tickerSymbol: tickerName) { tickerInfo in
                self.tickerInfo = tickerInfo
                print(self.tickerInfo)
                self.flag = true
            }
        }
        
        
    }
}
