//
//  ArtistLookupContract.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 22-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

protocol ArtistLookupView: class {
  var presenter: ArtistLookupPresentation! { get set }
  
  func showLoadingIndicator()
  func hideLoadingIndicator()
  func showTracks(_ tracks: [Track])
  func showNoResultsScreen()
}

protocol ArtistLookupPresentation: class {
  weak var view: ArtistLookupView? { get set }
  var interactor: ArtistLookupUsesCase! { get set }
  var router: ArtistLookupWireframe! { get set }
  
  func viewDidLoad()
  func didSelectTrack(_ track: Track)
}

protocol ArtistLookupUsesCase: class {
  weak var output: ArtistLookupInteractorOutput! { get set }
  
  func fetchTracks(artist id: Int)
}

protocol ArtistLookupInteractorOutput: class {
  func tracksFetched(_ tracks: [Track])
  func tracksFetchFailed(_ error: Error)
}

protocol ArtistLookupWireframe: class {
  weak var viewController: UIViewController? { get set }
  
  static func assembleModule(artistId: Int) -> UIViewController
  
  func presentWebView(url: String)
  func presentAlertDialog(message: String)
  func presentNoResultMessage()
}

