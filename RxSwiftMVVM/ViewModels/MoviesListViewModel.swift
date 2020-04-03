//
//  CountriesListViewModel.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 27/03/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import Foundation
import RxSwift

final class MoviesListViewModel {
    let title = "RxSwiftMVVM"
    
    private let apiService: ApiServiceProtocol
    
    init(serviceProtocol: ApiServiceProtocol = ApiService()) {
        self.apiService = serviceProtocol
    }
    
    func fetchMoviesViewModels() -> Observable<[MovieViewModel]> {
        apiService.fetchAllMovies().map { $0.map {
            MovieViewModel(movie: $0)
            }}
    }
}
