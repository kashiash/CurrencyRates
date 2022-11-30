//
//  CurrencyADetauilRowView.swift
//  CurrencyRates
//
//  Created by Jacek Kosiński G on 30/11/2022.
//

import SwiftUI

struct CurrencyADetailRowView: View {
    let rate: DetailARate
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(rate.effectiveDate)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.callout)
                Text(rate.id)
                    .foregroundColor(.green)
                    .font(.footnote)
            }
            .padding()
            VStack(alignment: .trailing){
                Text(String(format: "%.4f",rate.mid))
                    .font(.callout)
                    .foregroundColor(.red)
            }
            .padding()
        }

        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.secondary.opacity(0.15))
                    )
    }
}

struct CurrencyADetauilRowView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyADetailRowView(rate: DetailARate.example)
    }
}
