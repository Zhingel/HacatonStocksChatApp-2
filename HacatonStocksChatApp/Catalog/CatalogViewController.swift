//
//  CatalogViewController.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import Foundation
import UIKit
class CatalogViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    var tickers = Ticker()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
        let fetchData = FetchData()
        fetchData.fetchData { ticker in
            DispatchQueue.main.async {
                self.tickers = ticker
                self.collectionView.reloadData()
                print(self.tickers)
            }
        }
        print(tickers)
        collectionView.register(CatalogViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tickers.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        return CGSize(width: width, height: 90)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatalogViewCell
        cell.ticker = tickers[indexPath.item]
     
        return cell
    }
}
