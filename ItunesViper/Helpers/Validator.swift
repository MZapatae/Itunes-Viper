//
//  Validations.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import Foundation

class Validator {
  
  static func isQueryValid(_ testQuery: String) -> Bool {
    guard testQuery.isEmpty else { return false }
    return true
  }
  
}
