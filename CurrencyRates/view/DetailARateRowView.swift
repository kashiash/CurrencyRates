//
//  CurrencyARateDetailView.swift
//  CurrencyRates
//
//  Created by Jacek Kosiński G on 01/12/2022.
//

import SwiftUI

struct DetailARateRowView: View {
    let rate: DetailARate
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(rate.effectiveDate).font(.title).frame(maxWidth: .infinity, alignment: .leading)
                Text(rate.id).font(.callout)
            }.padding()
            VStack(alignment: .trailing){
               
                Text(String(format: "%.4f",rate.mid)).font(.title).foregroundColor(.red)
            }
        }
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.secondary.opacity(0.15))
        )
    }
}

struct CurrencyARateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailARateRowView(rate: DetailARate.example)
    }
}
