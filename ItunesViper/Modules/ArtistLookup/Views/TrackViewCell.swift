//
//  TrackViewCell.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 22-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit
import Kingfisher

class TrackViewCell: UITableViewCell {
  @IBOutlet weak var songNameLabel: UILabel!
  @IBOutlet weak var albumNameLabel: UILabel!
  @IBOutlet weak var albumImage: UIImageView!

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setupCellData(_ track: Track) {
    KingfisherManager.shared.cache.clearMemoryCache()
    albumImage.kf.setImage(with: URL(string: track.artworkUrl))
    songNameLabel.text = track.name
    albumNameLabel.text = track.album
  }

}
