//
//  FirstViewController.swift
//  RGG_Digital
//
//  Created by Xolani VILAKAZI on 2019/10/26.
//  Copyright © 2019 Xolani VILAKAZI. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true) 
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true) 
        
    }
    
}


