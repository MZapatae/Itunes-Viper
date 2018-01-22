//
//  AppNavigation.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

class AppNavigation: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.isTranslucent = false
    navigationBar.barTintColor = UIColor.darkGray
    navigationBar.tintColor = .white
    navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
}
