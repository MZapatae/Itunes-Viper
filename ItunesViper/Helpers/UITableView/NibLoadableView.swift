//
//  NibLoadableView.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 21-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
  
  static var NibName: String {
    return String(describing: self)
  }
}

