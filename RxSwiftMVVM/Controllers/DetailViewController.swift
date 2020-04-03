//
//  DetailViewController.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 03/04/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    
    private var viewModel: MovieViewModel!

    static func instantiateFromStoryboard(viewModel: MovieViewModel) -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: self)) as! DetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        movieTitle.text = viewModel.movie.title
        movieImage.sd_setImage(with: URL(string: viewModel.movie.image), placeholderImage: nil, options: [.progressiveLoad], context: nil)
        movieRating.text = "Rating: \(viewModel.movie.rating)"
        movieGenre.text = viewModel.movie.genre.joined(separator:", ")
    }

}
