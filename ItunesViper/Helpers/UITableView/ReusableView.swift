//
//  ReusableView.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 21-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
