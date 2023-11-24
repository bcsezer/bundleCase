//
//  HomeViewControllerInteractor.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeViewControllerBusinessLogic {
    func handle(request: HomeViewController.GetPackages.Request)
}

class HomeViewControllerInteractor: HomeViewControllerBusinessLogic {
    var presenter: HomeViewControllerPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: HomeViewController.GetPackages.Request) {
        NetworkManager.shared.getPackages { result in
            print(result)
        } failure: { error in
            print(error)
        }
    }
}
