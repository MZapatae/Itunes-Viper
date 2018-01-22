//
//  ArtistSearchPresenter.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

class ArtistSearchPresenter: ArtistSearchPresentation {
  weak var view: ArtistSearchView?
  var interactor: ArtistSearchUsesCase!
  var router: ArtistSearchWireframe!
  
  var artists: [Artist] = [] {
    didSet {
      if artists.isEmpty {
        view?.showSearchNoResultsScreen()
        router.presentNoResultMessage()
      } else {
        view?.showSearchResults(artists)
      }
    }
  }
  
  func didSearchArtist(byName query: String) {
    if Validator.isQueryValid(query) {
      interactor.searchArtist(byName: query)
    } else {
      router.presentAlertDialog(message: "Debe ingresar un artista a buscar")
    }
  }
  
  func didSelectedArtist(_ artist: Artist) {
    router.presentWebView(url: artist.linkUrl)
  }

}

extension ArtistSearchPresenter: ArtistSearchInteractorOutput {
  
  func searchResults(_ artists: [Artist]) {
    self.artists = artists
    view?.hideLoadingIndicator()
  }
  
  func searchFailed(_ error: Error) {
    self.artists.removeAll()
    view?.hideLoadingIndicator()
    router.presentAlertDialog(message: error.localizedDescription)
  }
  
}
