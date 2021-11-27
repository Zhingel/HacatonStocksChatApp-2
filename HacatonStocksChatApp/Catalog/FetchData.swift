//
//  FetchData.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//
// old api = "691e17d38a1864f345b79310fdfe1654"
import Foundation
import SwiftUI
class FetchData: ObservableObject {
    let APIKey = "3ed4c61bea8c7937ab69c6a76f250e8f"
    var searchingText = ""
    var tickers = Ticker()
    var tickerInfo = TickerInfo()

    func fetchData(searcText: String, completion: @escaping (Ticker) -> ()) {
        let url = URL(string: "https://financialmodelingprep.com/api/v3/search?query=\(searcText)&limit=10&exchange=NASDAQ&apikey=\(APIKey)")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            let ticker = try! JSONDecoder().decode(Ticker.self, from: data)
            completion(ticker)
        }
        task.resume()
         

    }
    func fetchDataStockInfo(tickerSymbol: String,  completion: @escaping (TickerInfoElement) -> ()) {
        let url = URL(string: "https://financialmodelingprep.com/api/v3/profile/\(tickerSymbol)?apikey=\(APIKey)")

        var request = URLRequest(url: url!)

        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let ticker = try! JSONDecoder().decode(TickerInfo.self, from: data)
            completion(ticker[0])
//            DispatchQueue.main.async {
//                self.tickerInfo = ticker
//                print(self.tickerInfo)
//            }
        }

        task.resume()
         

    }
}

