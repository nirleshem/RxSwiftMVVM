//
//  Constants.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 27/03/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import Foundation

struct Constants {
    
    private static let baseUrl = "https://api.androidhive.info/json"
    private static let endPoint = "/movies.json"

    struct Movies {
        static let getList = baseUrl + endPoint
    }
}
