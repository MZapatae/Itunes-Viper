//
//  ArtistSearchVC.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

class ArtistSearchVC: UIViewController {
  var presenter: ArtistSearchPresentation!
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
}

extension ArtistSearchVC: ArtistSearchView {
  
  func showLoadingIndicator() {
    //code...
  }
  
  func hideLoadingIndicator() {
    //code...
  }
  
  func showSearchResults(_ artists: [Artist]) {
    //code...
  }
  
  func showSearchNoResultsScreen() {
    //code...
  }
  
  
  
}
