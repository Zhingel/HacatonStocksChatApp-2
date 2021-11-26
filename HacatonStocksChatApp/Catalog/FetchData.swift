//
//  FetchData.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import Foundation

class FetchData {
    let APIKey = "ee9627ed00ec29067dd773cb47bc7948"
    var searchingText = ""
    var tickers = Ticker()
 
    var tickerInfo = TickerInfo()
//    init() {
//
//        fetchData()
//    }
    func fetchData(completion: @escaping (Ticker) -> ()) {
        let url = URL(string: "https://financialmodelingprep.com/api/v3/search?query=\(searchingText)&limit=10&exchange=NASDAQ&apikey=\(APIKey)")

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

    //        let json = try! JSONSerialization.jsonObject(with: data, options: [])
            
            let ticker = try! JSONDecoder().decode(Ticker.self, from: data)
//            DispatchQueue.main.async {
//                self.tickers = ticker
            //    print(self.tickers)
                completion(ticker)
//            }
        }

        task.resume()
         

    }
    func fetchDataStockInfo(tickerSymbol: String) {
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
            DispatchQueue.main.async {
                self.tickerInfo = ticker
                print(self.tickerInfo)
            }
        }

        task.resume()
         

    }
}

