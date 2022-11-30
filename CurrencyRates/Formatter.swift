//
//  Formatter.swift
//  CurrencyRates
//
//  Created by Jacek Kosiński G on 30/11/2022.
//

import Foundation

class Formatter{
    class func getCurrency(_ number: Double) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number)) ?? "N/A"
    }
}
