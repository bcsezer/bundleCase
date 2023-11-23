//
//  ViewControllerFactory.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//

import UIKit

class ViewControllerFactory {
    static let sharedInstance = ViewControllerFactory()
    
    private init() {}
    
    func makeHomeViewController() -> UIViewController {
        let viewController = HomeViewControllerViewController(nibName: "HomeViewControllerView", bundle: nil)
        let interactor = HomeViewControllerInteractor()
        let presenter = HomeViewControllerPresenter()
        let router = HomeViewControllerRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
  
    func makeDetailViewControlelr() -> UIViewController {
        let viewController = DetailViewControlelrViewController(nibName: "DetailViewControlelrView", bundle: nil)
        let interactor = DetailViewControlelrInteractor()
        let presenter = DetailViewControlelrPresenter()
        let router = DetailViewControlelrRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
