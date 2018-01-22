//
//  ArtistLookupInteractor.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 22-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

class ArtistLookupInteractor: ArtistLookupUsesCase {
  weak var output: ArtistLookupInteractorOutput!
  
  func fetchTracks(artist id: Int) {
    print ("Fetch artist \(id) tracks...")
    ApiClient.sharedInstance.request(API.lookupArtist(id: id), onSuccess: { (response) in
      if let results = response.results {
        var tracks: [Track] = []
        results.forEach({ (result) in
          if let artistName = result.artistName, let albumName = result.collectionName, let trackName = result.trackName,
            let previewUrl = result.previewUrl, let artworkUrl = result.artworkUrl100, let artistUrl = result.artistUrl {
            
            let track = Track(artist: artistName,
                              album: albumName,
                              name: trackName,
                              previewUrl: previewUrl,
                              artworkUrl: artworkUrl,
                              artistUrl: artistUrl)
            
            tracks.append(track)
          }
        })
        self.output.tracksFetched(tracks)
      }
      
    }) { (error) in
      self.output.tracksFetchFailed(error)
    }
  }
}
