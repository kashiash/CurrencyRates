//
//  ContentView.swift
//  CurrencyRates
//
//  Created by Jacek Kosiński G on 29/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rates = [CurrencyARate]()
    var body: some View {

        NavigationStack{
            List(rates) { rate in
                NavigationLink(){
                    DetailView(rate: rate)
                } label : {
                    HStack{
                        CurrencyARateRowView(rate: rate)
                    }
                }
            }
        }.navigationTitle("Curency rates")
            .task(loadRates)
    }
    
   @Sendable func loadRates(){
                       let url = URL(string: "https://api.nbp.pl/api/exchangerates/tables/A/")!
                        self.fetch(url)
    }
    
     func fetch(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Problem wuth fetching data")
            } else if let data = data {

                let decoder = JSONDecoder()
                do {
                    
                    let result = try decoder.decode([NbpATable].self, from: data)

                    
                    if (result[0].rates != nil) {
                        rates = result[0].rates
                    }
                } catch {
                    print("Problem with decoding JSON")
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().preferredColorScheme(.dark)
    }
}
