//
//  HomeViewControllerPresenter.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeViewControllerPresentationLogic {
    func present(response: HomeViewController.Something.Response)
}

class HomeViewControllerPresenter: HomeViewControllerPresentationLogic {
    weak var viewController: HomeViewControllerDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: HomeViewController.Something.Response) {
        let viewModel = HomeViewController.Something.ViewModel()
        viewController?.display(viewModel: viewModel)
    }
}
