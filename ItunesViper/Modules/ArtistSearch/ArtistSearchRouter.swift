//
//  ArtistSearchRouter.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 20-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit

class ArtistSearchRouter: ArtistSearchWireframe {
  
  weak var viewController: UIViewController?
  
  static func assembleModule() -> UIViewController {
    let view = ArtistSearchVC(nibName: "ArtistSearchView", bundle: nil)
    let presenter = ArtistSearchPresenter()
    let interactor = ArtistSearchInteractor()
    let router = ArtistSearchRouter()
    
    let navigation = AppNavigation(rootViewController: view)
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    interactor.output = presenter
    
    router.viewController = view
    
    return navigation
  }
  
}
