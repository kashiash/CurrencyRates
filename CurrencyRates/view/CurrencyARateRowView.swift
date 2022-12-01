//
//  CurencyRateADetailView.swift
//  CurrencyRates
//
//  Created by Jacek Kosiński G on 01/12/2022.
//

import SwiftUI

struct CurrencyARateRowView: View {
    let rate: CurrencyARate
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(rate.id)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .font(.title)
                /*@START_MENU_TOKEN@*/Text(rate.currency)/*@END_MENU_TOKEN@*/.font(.callout).foregroundColor(.green)
            }
            VStack(alignment: .leading){
                Text(String(format: "%.4f",rate.mid))
                    .foregroundColor(.red)
                    .background{
                        RoundedRectangle(cornerRadius: 5,style:.continuous)
                            .stroke(Color.white.opacity(0.2),lineWidth: 1)
                    }
            }
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.secondary.opacity(0.15)))
    }
}

struct CurencyRateADetailView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyARateRowView(rate: CurrencyARate.example)
    }
}
