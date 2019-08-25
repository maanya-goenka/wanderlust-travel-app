//
//  MapViewController.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/7/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Maps"

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title =  "Maps"
    }
    
}
