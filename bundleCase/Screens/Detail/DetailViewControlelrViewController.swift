//
//  DetailViewControlelrViewController.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailViewControlelrDisplayLogic: AnyObject {
    func display(viewModel: DetailViewControlelr.Something.ViewModel)
}

class DetailViewControlelrViewController: UIViewController, DetailViewControlelrDisplayLogic {
    var interactor: DetailViewControlelrBusinessLogic?
    var router: (NSObjectProtocol & DetailViewControlelrRoutingLogic)?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = DetailViewControlelr.Something.Request()
        interactor?.handle(request: request)
    }

    // MARK: Requests

    func display(viewModel: DetailViewControlelr.Something.ViewModel) {
    
    }
}
