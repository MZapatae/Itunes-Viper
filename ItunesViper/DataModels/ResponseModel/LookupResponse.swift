//
//  LookupResponse.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 21-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import ObjectMapper

struct LookupResponse {
  var resultCount: Int?
  var results: [TrackResponse]?
}

struct TrackResponse {
  var wrapperType: String?
  var artistName: String?
  var collectionName: String?
  var trackName: String?
  var previewUrl: String?
  var artworkUrl100: String?
  var artistUrl: String?
}

extension LookupResponse: Mappable {
  init?(map: Map) {
    guard map.JSON["resultCount"] != nil else { return nil }
    guard map.JSON["results"] != nil else { return nil }
  }
  
  mutating func mapping(map: Map) {
    resultCount   <- map["resultCount"]
    results       <- map["results"]
  }
}

extension TrackResponse: Mappable {
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    wrapperType     <- map["wrapperType"]
    artistName      <- map["artistName"]
    collectionName  <- map["collectionName"]
    trackName       <- map["trackName"]
    previewUrl      <- map["previewUrl"]
    artworkUrl100   <- map["artworkUrl100"]
    artistUrl       <- map["artistViewUrl"]
  }
}

