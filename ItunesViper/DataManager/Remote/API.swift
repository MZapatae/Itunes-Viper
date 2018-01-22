//
//  API.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import Foundation

enum API {
  
  static func searchArtists(query: String) -> Endpoint<SearchResponse> {
    return Endpoint<SearchResponse>(method: .get, path: "/search?term=\(query)&entity=musicArtist&attribute=artistTerm&media=music")
  }
  
  static func lookupArtist(id: Int) -> Endpoint<LookupResponse> {
    return Endpoint<LookupResponse>(method: .get, path: "/lookup?amgArtistId=\(id)&entity=song&limit=5&sort=recent")
  }
  
}
