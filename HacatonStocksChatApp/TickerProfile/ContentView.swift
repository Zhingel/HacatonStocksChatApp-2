//
//  ContentView.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 27.11.2021.
//

import SwiftUI

struct ContentView: View {
    var ticker: TickerInfoElement
    @ObservedObject var viewModel = FetchData()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
     //   Color.brown
        TopBarView(ticker: ticker)
        .navigationTitle("ticker.companyName")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
            Text("Back")
        }))
    }
}