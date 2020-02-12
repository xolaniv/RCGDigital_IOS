//
//  LoginViewController.swift
//  RGG_Digital
//
//  Created by Xolani VILAKAZI on 2019/10/26.
//  Copyright © 2019 Xolani VILAKAZI. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: true) //Hide
        super.viewDidLoad()
    
       // view.layer.addSublayer(Utilities.VerticalGradientLayer)
       // Utilities.VerticalGradientLayer.frame = view.bounds
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        Utilities.styleHollowButton(loginButton)
        Utilities.styledFilledButton(registerButton)
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   

}
