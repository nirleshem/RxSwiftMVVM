//
//  Country.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 27/03/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let image: String
    let rating: Double
    let releaseYear: Int
    let genre: Array<String>
}
