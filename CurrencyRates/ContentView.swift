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

//            Button("Fetch data"){
//               let url = URL(string: "https://api.nbp.pl/api/exchangerates/tables/A/")!
//                self.fetch(url)
//            }
        NavigationStack{
            List(rates) { rate in
                NavigationLink(){
                    DetailView(rate: rate)
                } label : {
                    HStack{
                        Text(rate.id).font(.title)
                        /*@START_MENU_TOKEN@*/Text(rate.currency)/*@END_MENU_TOKEN@*/.font(.callout)
                        Text(String(format: "%.4f",rate.mid))
                            .foregroundColor(.red)
                            .background{
                                RoundedRectangle(cornerRadius: 5,style:.continuous)
                                    .stroke(Color.white.opacity(0.2),lineWidth: 1)
                            }
                    }
                }
            }
        }.navigationTitle("Curency rates")
            .task(loadRates)
    }
    
    func loadRates(){
                       let url = URL(string: "https://api.nbp.pl/api/exchangerates/tables/A/")!
                        self.fetch(url)
    }
    
     func fetch(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Problem wuth fetching data")
            } else if let data = data {
                // decode json to colection
               // print(String(data: data, encoding: .utf8))
                let decoder = JSONDecoder()
                do {
                    
                    let result = try decoder.decode([NbpATable].self, from: data)
                    print(result)
                    
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
    }
}
