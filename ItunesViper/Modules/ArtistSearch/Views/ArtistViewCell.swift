//
//  ArtistViewCell.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 21-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

class ArtistViewCell: UITableViewCell {
  @IBOutlet weak var artistNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setupCellData(_ artist: Artist) {
    artistNameLabel.text = artist.name
  }
  
}
