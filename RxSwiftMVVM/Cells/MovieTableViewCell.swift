//
//  CountryTableViewCell.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 27/03/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    
    func configure(with viewModel: MovieViewModel) {
        movieTitle.text = "\(viewModel.movie.title) - \(viewModel.movie.releaseYear)"
        movieImage.sd_setImage(with: URL(string: viewModel.movie.image), placeholderImage: nil, options: [.progressiveLoad], context: nil)
        movieRating.text = "Rating: \(viewModel.movie.rating)"
        movieGenre.text = viewModel.movie.genre.joined(separator:", ")
        
        self.movieImage.layer.cornerRadius = 8
        self.movieImage.clipsToBounds = true
        
        movieTitle.adjustsFontForContentSizeCategory = true
        movieRating.adjustsFontForContentSizeCategory = true
        movieGenre.adjustsFontForContentSizeCategory = true
        movieTitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        movieRating.font = UIFont.preferredFont(forTextStyle: .caption1)
        movieGenre.font = UIFont.preferredFont(forTextStyle: .caption1)
    }
}

extension UITableViewCell {    
    static var id: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}
