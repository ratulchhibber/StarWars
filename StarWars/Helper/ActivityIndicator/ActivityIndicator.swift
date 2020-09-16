//
//  ActivityIndicator.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class ActivityIndicator {
    
    static let shared = ActivityIndicator()
    var container = UIView()
    var activityIndicator = UIActivityIndicatorView()

    private init() { }
    
    func show(in view: UIView) {
        loadingView.center = view.center
        view.addSubview(loadingView)
        loadingView.play()
    }
    
    private var loadingView: AnimationView = {
        let jsonName = "loaderAnimation"
        let animation = Animation.named(jsonName)

        // Load animation to AnimationView
        let animationView = AnimationView(animation: animation)
        animationView.frame = CGRect(origin: .zero,
                                     size: CGSize(width: 100, height: 100))
        animationView.loopMode = .loop
        // Play the animation
        return animationView
    }()

    func hide() {
        loadingView.stop()
        loadingView.removeFromSuperview()
    }
}
