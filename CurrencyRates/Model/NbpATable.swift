//
//  NbpATable.swift
//  CurrencyRates
//
//  Created by Jacek Kosiński G on 29/11/2022.
//

import Foundation


struct NbpATable: Codable {

  var table         : String
  var no            : String
  var effectiveDate : String
  var rates         : [CurrencyARate] = []

  enum CodingKeys: String, CodingKey {

    case table         = "table"
    case no            = "no"
    case effectiveDate = "effectiveDate"
    case rates         = "rates"
  
  }



}

struct CurrencyARate: Codable,Identifiable {

  var currency : String
  var id     : String
  var mid      : Double

  enum CodingKeys: String, CodingKey {

    case currency = "currency"
    case id     = "code"
    case mid      = "mid"
  
  }

    static let example = CurrencyARate(currency: "Euro radziecki", id: "EUR", mid: 5.4321)

}

struct DetailaATable: Codable {

  var table    : String
  var currency : String
  var code     : String
  var rates    : [DetailARate]

  enum CodingKeys: String, CodingKey {

    case table    = "table"
    case currency = "currency"
    case code     = "code"
    case rates    = "rates"
  
  }



}


struct DetailARate: Codable ,Identifiable{

  var id            : String
  var effectiveDate : String
  var mid           : Double

  enum CodingKeys: String, CodingKey {

    case id            = "no"
    case effectiveDate = "effectiveDate"
    case mid           = "mid"
  
  }

    static let example = DetailARate(id: "23/NBP/666/99999", effectiveDate: "2022-01-23", mid: 4.1234)

}
