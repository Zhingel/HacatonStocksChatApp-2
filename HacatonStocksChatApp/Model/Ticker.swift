//
//  Ticker.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import Foundation

// MARK: - TickerElement
struct TickerElement: Codable {
    let symbol, name: String
    let currency: Currency
    let stockExchange: String
    let exchangeShortName: ExchangeShortName
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum ExchangeShortName: String, Codable {
    case nasdaq = "NASDAQ"
}

typealias Ticker = [TickerElement]


struct TickerInfoElement: Codable {
    let symbol: String
    let price, beta: Double
    let volAvg, mktCap: Int
    let lastDiv: Double
    let range: String
    let changes: Double
    let companyName, currency, cik, isin: String
    let cusip, exchange, exchangeShortName, industry: String
    let website: String
    let tickerInfoDescription, ceo, sector, country: String
    let fullTimeEmployees, phone, address, city: String
    let state, zip: String
    let dcfDiff, dcf: Double
    let image: String
    let ipoDate: String
    let defaultImage, isEtf, isActivelyTrading, isAdr: Bool
    let isFund: Bool

    enum CodingKeys: String, CodingKey {
        case symbol, price, beta, volAvg, mktCap, lastDiv, range, changes, companyName, currency, cik, isin, cusip, exchange, exchangeShortName, industry, website
        case tickerInfoDescription = "description"
        case ceo, sector, country, fullTimeEmployees, phone, address, city, state, zip, dcfDiff, dcf, image, ipoDate, defaultImage, isEtf, isActivelyTrading, isAdr, isFund
    }
}

typealias TickerInfo = [TickerInfoElement]
