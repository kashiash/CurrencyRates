//
//  CurrencyARateRowView.swift
//  CurrencyRates
//
//  Created by Jacek Kosiński G on 30/11/2022.
//

import SwiftUI

struct CurrencyARateRowView: View {
    let rate: CurrencyARate
    var body: some View {
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
        .padding()
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.secondary.opacity(0.15))
                    )
        
    }
}

struct CurrencyARateRowView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyARateRowView(rate: CurrencyARate.example)
    }
}
