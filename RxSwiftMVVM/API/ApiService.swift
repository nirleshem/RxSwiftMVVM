//
//  ApiService.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 27/03/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import Foundation
import RxSwift

protocol ApiServiceProtocol {
    func fetchAllMovies() -> Observable<[Movie]>
}

class ApiService: ApiServiceProtocol {
    
    func fetchAllMovies() -> Observable<[Movie]> {
     
        return Observable.create { observer -> Disposable in
            
            guard let url = URL(string: Constants.Movies.getList) else {
                return Disposables.create {}
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data else {
                    return observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                }
                
                do {
                    let countries = try JSONDecoder().decode([Movie].self, from: data)
                    observer.onNext(countries)
                    
                } catch {
                    observer.onError(error)
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
