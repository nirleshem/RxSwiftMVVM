//
//  LoaderView.swift
//  RxSwiftMVVM
//
//  Created by Nir Leshem on 27/03/2020.
//  Copyright © 2020 Nir Leshem. All rights reserved.
//

import UIKit

class LoadingView {
    
    static var overlay: UIView!
    
    static func present(in view: UIView) {
        if overlay != nil {
            overlay?.removeFromSuperview()
        }
        let spinner = UIActivityIndicatorView()
        spinner.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        spinner.center = view.center
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        
        overlay = UIView(frame: view.frame)
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        overlay.addSubview(spinner)
        
        view.addSubview(overlay)
    }
    
    static func hide() {
        overlay?.removeFromSuperview()
    }
}
