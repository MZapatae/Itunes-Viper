//
//  ArtistLookupView.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 22-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

class ArtistLookupVC: UIViewController {
  var presenter: ArtistLookupPresentation!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
  }
}

extension ArtistLookupVC: ArtistLookupView {
  
  func showLoadingIndicator() {
    //code
  }
  
  func hideLoadingIndicator() {
    //code
  }
  
  func showTracks(_ tracks: [Track]) {
    //code
  }
  
  func showNoResultsScreen() {
    //code
  }
  
}
