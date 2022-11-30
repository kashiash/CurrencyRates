//
//  DetailView.swift
//  CurrencyRates
//
//  Created by Jacek Kosiński G on 29/11/2022.
//

import SwiftUI

struct DetailView: View {
    var rate: CurrencyARate
    @State private var rates = [DetailARate]()
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(rate.id)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                    Text(rate.currency)
                        .foregroundColor(.green)
                        .font(.footnote)
                }
                VStack(alignment: .trailing){
                    Text(String(format: "%.4f",rate.mid))
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
            List(rates) { item in
                HStack{
                    CurrencyADetailRowView(rate: item)
                }
            }
            
        }
        .task(loadData)
    }
    
    func loadData() {
        let url = URL(string:"https://api.nbp.pl/api/exchangerates/rates/A/\(rate.id)/last/100/")!
        fetch(url: url)
    }
    
    func fetch(url: URL){
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print("Problem with fetching data")
            } else if let data = data{
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DetailaATable.self, from: data)
                    rates = result.rates
                } catch {
                    print("Problem with decoding json")
                }
            }
        }
        .resume()
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(rate: CurrencyARate.example)
        DetailView(rate: CurrencyARate.example).preferredColorScheme(.dark)
    }
}
