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
  
  @IBOutlet weak var resultsTableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  let searchController = UISearchController(searchResultsController: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
  }
}

extension ArtistSearchVC: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    presenter.didSearchArtist(byName: searchBar.text ?? "")
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
