//
//  ArtistSearchInteractor.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

class ArtistSearchInteractor: ArtistSearchUsesCase {
  weak var output: ArtistSearchInteractorOutput!
  
  func searchArtist(byName query: String) {
    print ("Connecting iTunes Api...")
    ApiClient.sharedInstance.request(API.searchArtists(query: query), onSuccess: { (response) in
      if let results = response.results {
        var artists: [Artist] = []
        results.forEach({ (result) in
          
          // Disclaimer: If the result not contain and amgArtistId, will NOT SHOW as a result. Because i need this value
          // for show the detail value.
          if let artistId = result.amgArtistId, let artistName = result.artistName, let artistLinkUrl = result.artistLinkUrl {
            let artist = Artist(id: artistId, name: artistName, linkUrl: artistLinkUrl)
            artists.append(artist)
          }
          
        })
        self.output.searchResults(artists)
      }
      
    }) { (error) in
      self.output.searchFailed(error)
    }
  }
  
}
