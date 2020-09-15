//
//  ViewController.swift
//  StarWars
//
//  Created by Ratul Chhibber on 15/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create Animation object
        view.backgroundColor = .black
        let jsonName = "starWars"
        let animation = Animation.named(jsonName)

        // Load animation to AnimationView
        let animationView = AnimationView(animation: animation)
        animationView.frame = view.frame
        animationView.loopMode = .repeat(2)

        // Add animationView as subview
        view.addSubview(animationView)

        // Play the animation
        animationView.play { isFinished in
            print("Completed")
        }
    }


}

