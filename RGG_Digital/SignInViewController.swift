//
//  SignInViewController.swift
//  RGG_Digital
//
//  Created by Xolani VILAKAZI on 2020/01/16.
//  Copyright © 2020 Xolani VILAKAZI. All rights reserved.
//

import UIKit
import FirebaseAuth

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
        
        let email = emailAddresstxt.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Password = passwordText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email!, password: Password!) { (res, error) in
            if (error != nil)
            {
                if (Password == "" || email == "") {
                    DispatchQueue.main.async {
                        self.showErrorMessage("There is an empty field, please make sure they are all filled!")
                    }
                }
                else {
                DispatchQueue.main.async {
                    self.showErrorMessage("Error Logging in \(String(describing: error?.localizedDescription))")
                    }
                }
            }
            else
            {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    func showErrorMessage(_ message: String)
       {
           let alertContoler = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           let myAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertContoler.addAction(myAction)
           self.present(alertContoler,animated: true, completion: nil)
       }
    
}
