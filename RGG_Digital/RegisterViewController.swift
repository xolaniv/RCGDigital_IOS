//
//  RegisterViewController.swift
//  RGG_Digital
//
//  Created by Xolani VILAKAZI on 2019/10/26.
//  Copyright © 2019 Xolani VILAKAZI. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNametxt: UITextField!
    @IBOutlet weak var lastNametxt: UITextField!
    @IBOutlet weak var emailAddresstxt: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var errorText: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: true) //SHow
        super.viewDidLoad()
        //view.layer.addSublayer(Utilities.VerticalGradientLayer)
        setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        errorText.alpha = 0
        Utilities.styledTextField(firstNametxt)
        Utilities.styledTextField(lastNametxt)
        Utilities.styledTextField(emailAddresstxt)
        Utilities.styledTextField(PasswordText)
        Utilities.styledFilledButton(signInButton)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func validateFields() -> String? {
        //check if all fields are not empty
        if firstNametxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNametxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailAddresstxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return ("Pleas fill in all fields")
        }
        /*let cleanPassword:String = (PasswordText.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        if (Utilities.isPasswordValid(cleanPassword) == false)
        {
            return "Please enter password with 8 chararcters containg special character and number"
        }*/
        return nil
        
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        let error  =  validateFields()
        
        if (error != nil)
        {
            DispatchQueue.main.async {
                self.showErrorMessage(error!)
            }
        }
        else
        {
            let firstName = firstNametxt.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNametxt.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailAddresstxt.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Password = PasswordText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            //create user
            Auth.auth().createUser(withEmail: email!, password: Password!) { (result, err) in
                //check for errors
                if err != nil {
                    DispatchQueue.main.async {
                        self.showErrorMessage("Error creating user")
                    }
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data:["firstName":firstName!, "lastName":lastName!, "uid":result!.user.uid]) { (error) in
                        
                        if error != nil
                        {
                            DispatchQueue.main.async {
                                self.errorMessage("User imformation couldnt be saved")
                            }
                        }
                    }
                    self.transitionToHome()
                }
            }
        }
    }
    func errorMessage(_ message: String) {
        errorText.text = message
        errorText.alpha = 1
    }
    
    func showErrorMessage(_ message: String)
    {
        let alertContoler = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let myAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertContoler.addAction(myAction)
        self.present(alertContoler,animated: true, completion: nil)
    }
    func transitionToHome()
    {
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
}
