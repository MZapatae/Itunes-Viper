//
//  ArtistLookupPresenter.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 22-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

class ArtistLookupPresenter: ArtistLookupPresentation {
  weak var view: ArtistLookupView?
  var interactor: ArtistLookupUsesCase!
  var router: ArtistLookupWireframe!
  
  var selectedArtist: Artist!
  var tracks: [Track] = [] {
    didSet {
      if tracks.isEmpty {
        view?.showNoResultsScreen()
      } else {
        view?.showTracks(tracks)
      }
    }
  }
  
  func viewDidLoad() {
    interactor.fetchTracks(artistId: selectedArtist.id)
    view?.showArtistInfo(selectedArtist)
  }
  
  func didSelectTrack(_ track: Track) {
    //code
  }
}

extension ArtistLookupPresenter: ArtistLookupInteractorOutput {
  
  func tracksFetched(_ tracks: [Track]) {
    self.tracks = tracks
    view?.hideLoadingIndicator()
  }
  
  func tracksFetchFailed(_ error: Error) {
    view?.hideLoadingIndicator()
    router.presentAlertDialog(message: error.localizedDescription)
  }

}
