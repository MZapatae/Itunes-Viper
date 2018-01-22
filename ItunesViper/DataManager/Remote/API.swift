//
//  API.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import Foundation

enum API {
  
  static func searchArtists(query: String) -> Endpoint<ResultsResponse> { //TODO: Improve options with enums
    return Endpoint<ResultsResponse>(method: .get, path: "/?term=\(query)&entity=musicArtist&attribute=artistTerm&media=music")
  }
  
}
