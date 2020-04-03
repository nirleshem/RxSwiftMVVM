//
//  AppCoordinator.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 27/03/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController.instantiateFromStoryboard(viewModel: MoviesListViewModel())
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
