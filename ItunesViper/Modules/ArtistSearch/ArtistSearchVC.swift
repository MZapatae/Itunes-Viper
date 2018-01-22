//
//  ArtistSearchVC.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit
import PKHUD

class ArtistSearchVC: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  var presenter: ArtistSearchPresentation!

  var artists: [Artist] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Itunes Artistas"
    searchBar.delegate = self
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ArtistViewCell.self)
    
  }
}

extension ArtistSearchVC: ArtistSearchView {
  
  func showLoadingIndicator() {
    HUD.show(.progress)
  }
  
  func hideLoadingIndicator() {
    HUD.hide()
  }
  
  func showSearchResults(_ artists: [Artist]) {
    self.artists = artists
    tableView.isHidden = false
  }
  
  func showSearchNoResultsScreen() {
    tableView.isHidden = true
  }
  
}

extension ArtistSearchVC: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    presenter.didSearchArtist(byName: searchBar.text ?? "")
  }
  
}

extension ArtistSearchVC: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return artists.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ArtistViewCell
    cell.setupCellData(artists[indexPath.row])
    return cell
  }
  
}

extension ArtistSearchVC: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelectedArtist(artists[indexPath.row])
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
