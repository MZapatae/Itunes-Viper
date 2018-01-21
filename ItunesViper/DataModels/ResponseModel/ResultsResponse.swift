//
//  Artist.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import ObjectMapper

struct ResultsResponse {
  var resultCount: Int?
  var results: [ArtistResponse]?
}

struct ArtistResponse {
  var wrapperType: String?
  var artistType: String?
  var artistName: String?
  var artistLinkUrl: String?
  var artistId: Int?
  var amgArtistId: Int?
  var primaryGenreName: String?
  var primaryGenreId: Int?
}

extension ResultsResponse: Mappable {
  init?(map: Map) {
    guard map.JSON["resultCount"] != nil else { return nil }
    guard map.JSON["results"] != nil else { return nil }
  }
  
  mutating func mapping(map: Map) {
    resultCount   <- map["resultCount"]
    results       <- map["results"]
  }
}

extension ArtistResponse: Mappable {
  init?(map: Map) {
    guard map.JSON["artistName"] != nil else { return nil }
    guard map.JSON["artistId"] != nil else { return nil }
  }
  
  mutating func mapping(map: Map) {
    wrapperType       <- map["wrapperType"]
    artistType        <- map["artistType"]
    artistName        <- map["artistName"]
    artistLinkUrl     <- map["artistLinkUrl"]
    artistId          <- map["artistId"]
    amgArtistId       <- map["amgArtistId"]
    primaryGenreName  <- map["primaryGenreName"]
    primaryGenreId    <- map["primaryGenreId"]
  }
}
