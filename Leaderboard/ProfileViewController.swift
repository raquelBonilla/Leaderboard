//
//  ProfileViewController.swift
//  Leaderboard
//
//  Created by Raquel Bonilla on 7/1/17.
//  Copyright © 2017 Raquel Bonilla. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signOutPressed(_ sender: Any) {
        if (AuthService.signOutUser()) {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let signInVC = sb.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            let navVC = UINavigationController(rootViewController: signInVC)
            self.parent?.present(navVC, animated: true, completion: nil)
        }
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
