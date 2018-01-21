//
//  ArtistSearchContract.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

protocol ArtistSearchView: class {
  var presenter: ArtistSearchPresentation! { get set }
 
  func showLoadingIndicator()
  func hideLoadingIndicator()
  func showSearchResults(_ artists: [Artist])
  func showSearchNoResultsScreen()
}

protocol ArtistSearchPresentation: class {
  weak var view: ArtistSearchView? { get set }
  var interactor: ArtistSearchUsesCase! { get set }
  var router: ArtistSearchWireframe! { get set }
  
  func didSearchArtist(byName query: String)
}

protocol ArtistSearchUsesCase: class {
  weak var output: ArtistSearchInteractorOutput! { get set }
  
  func searchArtist(byName query: String)
}

protocol ArtistSearchInteractorOutput: class {
  func searchResults(_ artists: [Artist])
  func searchFailed(_ error: Error)
}

protocol ArtistSearchWireframe: class {
  weak var viewController: UIViewController? { get set }
  
  static func assembleModule() -> UIViewController
}

