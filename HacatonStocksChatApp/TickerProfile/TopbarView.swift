//
//  TopbarView.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import SwiftUI

struct TopBarView: View {
    @State var currentSelection: Int = 0
    var dataPoints: [CGFloat]
    var ticker: TickerInfoElement
    var body: some View {
        
        PagerTabView(tint: .black,selection: $currentSelection){
            
            Text("График")
                .font(Font.system(size: 14))
                .pageLabel()
            
            Text("Информация")
                .font(Font.system(size: 14))
                .pageLabel()
            
            Text("Чат")
                .font(Font.system(size: 14))
                .pageLabel()
            
            Text("Другое")
                .font(Font.system(size: 14))
                .pageLabel()
            
        } content: {
            
            ScrollView {
                VStack {
                    Text(ticker.companyName)
                    ZStack {
                        Rectangle()
                            .strokeBorder()
                        StockViewGraphic(dataPoints: dataPoints)
                    }
                    .frame(height: 300)
                    .padding(.horizontal,5)
                }
            }
                .pageView(ignoresSafeArea: true, edges: .bottom)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Marcket Cap: ")
                        .bold()
                        .font(Font.system(size: 14))
                    + Text("\(ticker.mktCap)")
                        .font(Font.system(size: 14))
                    Text("Country: ")
                        .bold()
                        .font(Font.system(size: 14))
                    + Text("\(ticker.country)")
                        .font(Font.system(size: 14))
                    Text("Sector: ")
                        .bold()
                        .font(Font.system(size: 14))
                    + Text("\(ticker.sector)")
                        .font(Font.system(size: 14))
                    Text("Ipo date: ")
                        .bold()
                        .font(Font.system(size: 14))
                    + Text("\(ticker.ipoDate)")
                        .font(Font.system(size: 14))
                    Text("Company Info: ")
                        .bold()
                        .font(Font.system(size: 14))
                    + Text(ticker.tickerInfoDescription)
                        .font(Font.system(size: 14))
                }
                .padding()
            }
                .pageView(ignoresSafeArea: true, edges: .bottom)
            
            Color.yellow
                .pageView(ignoresSafeArea: true, edges: .bottom)
            
            Color.purple
                .pageView(ignoresSafeArea: true, edges: .bottom)
        }
        .padding(.top)
        .ignoresSafeArea(.container, edges: .bottom)

    }
}


