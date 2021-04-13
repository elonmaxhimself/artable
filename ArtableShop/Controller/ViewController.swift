//
//  ViewController.swift
//  ArtableShop
//
//  Created by Max Rimarchuk on 06.04.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: StoryboardId.LoginVC)
//        controller
//        modalPresentationStyle = .overFullScreen
        present(controller, animated: true, completion: nil)
    }

}

