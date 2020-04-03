//
//  ViewController.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 27/03/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.id)
            tableView.rx.setDelegate(self).disposed(by: disposeBag)
            tableView.backgroundColor = .clear
            tableView.tableFooterView = UIView()
        }
    }
    
    let disposeBag = DisposeBag()
    private var viewModel: MoviesListViewModel!
    
    static func instantiateFromStoryboard(viewModel: MoviesListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title
        
        viewModel.fetchMoviesViewModels().observeOn(MainScheduler.instance).bind(to:
        tableView.rx.items(cellIdentifier: MovieTableViewCell.id)) { index, viewModel, cell in
            
            if let cellToUse = cell as? MovieTableViewCell {
                cellToUse.configure(with: viewModel)
            }
            
        }.disposed(by: disposeBag)
        
        
        self.tableView.rx.modelSelected(MovieViewModel.self).subscribe(onNext: { [weak self] model in
            let viewController = DetailViewController.instantiateFromStoryboard(viewModel: model)
            self?.navigationController?.pushViewController(viewController, animated: true)
            
            if let selectedRow = self?.tableView.indexPathForSelectedRow {
                self?.tableView.deselectRow(at: selectedRow, animated: true)
            }
        }).disposed(by: self.disposeBag)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270.0
    }
}

