//
//  SignUpViewController.swift
//  Leaderboard
//
//  Created by Raquel Bonilla on 7/2/17.
//  Copyright © 2017 Raquel Bonilla. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        if let email = userNameTextField.text, let password = passwordTextField.text,
            let confirmPass = confirmPasswordTextField.text {
            if email.characters.count > 0 && password.characters.count > 0 && password.compare(confirmPass) == .orderedSame {
                self.signUp(email: email, password: password)
            } else {
                self.showSignUpErrorAlert()
            }
        }
    }

    func signUp(email: String!, password: String!) {
        AuthService.signUpUser(email: email, password: password, completion: { (user, error) in
            if error != nil {
                debugPrint(error.debugDescription)
            } else if let user = user {
                print(user.description)
                self.navigationController?.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    func showSignUpErrorAlert() {
        let alert = UIAlertController(title: "Invalid Email/Password", message: "Make sure email is valid and passwords match", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
