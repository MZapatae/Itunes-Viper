//
//  ArtistLookupView.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 22-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit
import PKHUD
import AVFoundation

class ArtistLookupVC: UIViewController {
  @IBOutlet weak var artistNameLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  var presenter: ArtistLookupPresentation!
  
  lazy var playerQueue : AVQueuePlayer = {
    return AVQueuePlayer()
  }()
  
  var tracks: [Track] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(TrackViewCell.self)
  }
  
  @IBAction func openInAppleMusicAction(_ sender: Any) {
    presenter.didPressAppleMusicButton()
  }
}

extension ArtistLookupVC: ArtistLookupView {
  
  func showArtistInfo(_ artist: Artist) {
    artistNameLabel.text = artist.name
  }
  
  func showLoadingIndicator() {
    HUD.show(.progress)
  }
  
  func hideLoadingIndicator() {
    HUD.hide()
  }
  
  func showTracks(_ tracks: [Track]) {
    self.tracks = tracks
    tableView.isHidden = false
  }
  
  func showNoResultsScreen() {
    tableView.isHidden = true
  }
  
  func playMusic(url: String) {
    if playerQueue.rate == 0 {
      let playerItem = AVPlayerItem(url: URL(string: url)!)
      playerQueue.insert(playerItem, after: nil)
      playerQueue.play()
    } else {
      playerQueue.pause()
      playerQueue.removeAllItems()
    }
  }
  
}

extension ArtistLookupVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tracks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TrackViewCell
    cell.setupCellData(tracks[indexPath.row])
    return cell
  }
}

extension ArtistLookupVC: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelectTrack(tracks[indexPath.row])
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
