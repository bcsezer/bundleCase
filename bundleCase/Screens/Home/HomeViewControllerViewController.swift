//
//  HomeViewControllerViewController.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeViewControllerDisplayLogic: AnyObject {
    func display(viewModel: HomeViewController.GetPackages.ViewModel)
}

class HomeViewControllerViewController: UIViewController, HomeViewControllerDisplayLogic {
    var interactor: HomeViewControllerBusinessLogic?
    var router: (NSObjectProtocol & HomeViewControllerRoutingLogic)?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = HomeViewController.GetPackages.Request()
        interactor?.handle(request: request)
    }

    // MARK: Requests

    func display(viewModel: HomeViewController.GetPackages.ViewModel) {
    
    }
}
