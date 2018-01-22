//
//  ArtistLookupRouter.swift
//  ItunesViper
//
//  Created by Miguel A. Zapata on 22-01-18.
//  Copyright © 2018 Miguel A. Zapata. All rights reserved.
//

import UIKit
import SafariServices

class ArtistLookupRouter: ArtistLookupWireframe {
  weak var viewController: UIViewController?
  
  static func assembleModule(artist: Artist) -> UIViewController {
    let view = ArtistLookupVC(nibName: "ArtistLookupView", bundle: nil)
    let presenter = ArtistLookupPresenter()
    let interactor = ArtistLookupInteractor()
    let router = ArtistLookupRouter()
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    presenter.selectedArtist = artist
    
    interactor.output = presenter
    
    router.viewController = view
    
    return view
  }
  
  func presentWebView(url: String) {
    let safariVC = SFSafariViewController(url: URL(string: url)!)
    viewController?.present(safariVC, animated: true, completion: nil)
  }
  
  func presentAlertDialog(message: String) {
    let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    viewController?.present(alert, animated: true, completion: nil)
  }
  
}
