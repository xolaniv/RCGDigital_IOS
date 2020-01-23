//
//  SignInViewController.swift
//  RGG_Digital
//
//  Created by Xolani VILAKAZI on 2020/01/16.
//  Copyright © 2020 Xolani VILAKAZI. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailAddresstxt: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: true) //SHow
        super.viewDidLoad()
        //view.layer.addSublayer(Utilities.VerticalGradientLayer)
        
        setUpElements()
    
    }
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styledTextField(emailAddresstxt)
        Utilities.styledTextField(passwordText)
        Utilities.styledFilledButton(loginButton)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
}
