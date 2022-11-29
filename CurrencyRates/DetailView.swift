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
            Text(rate.id).font(.title)
            HStack{
                /*@START_MENU_TOKEN@*/Text(rate.currency)/*@END_MENU_TOKEN@*/.font(.callout)
                Text(String(format: "%.4f",rate.mid))
                    .foregroundColor(.red)
                    .background{
                        RoundedRectangle(cornerRadius: 5,style:.continuous)
                            .stroke(Color.white.opacity(0.2),lineWidth: 1)
                    }
            }
            List(rates) { item in
                HStack{
                   // Text(item.id).font(.callout)
                    Text(item.effectiveDate).font(.title)
                    Text(String(format: "%.4f",item.mid)).font(.title).foregroundColor(.red)
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
    }
}
