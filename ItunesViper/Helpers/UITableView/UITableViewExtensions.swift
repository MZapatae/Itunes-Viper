//
//  UITableViewExtensions.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 21-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

extension UITableView {
  
  func register<T: UITableViewCell>(_: T.Type) {
    let Nib = UINib(nibName: T.NibName, bundle: nil)
    register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
}


