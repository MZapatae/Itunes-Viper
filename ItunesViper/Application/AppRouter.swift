//
//  AppRouter.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

class AppRouter {
  
  func setupRootScreen(in window: UIWindow) {
    let breedsVC = ArtistSearchRouter.assembleModule()
    presentView(viewController: breedsVC, in: window)
  }
  
  fileprivate func presentView(viewController: UIViewController, in window: UIWindow) {
    window.makeKeyAndVisible()
    window.rootViewController = viewController
  }
  
}
