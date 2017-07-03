//
//  MenuViewController.swift
//  Leaderboard
//
//  Created by Raquel Bonilla on 7/1/17.
//  Copyright © 2017 Raquel Bonilla. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuScrollView: UIScrollView!
    var leaderboardVC: LeaderboardViewController!
    var profileVC: ProfileViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = AuthService.currentUser() {
            
        } else {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let signInVC = sb.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            let navVC = UINavigationController(rootViewController: signInVC)
            self.present(navVC, animated: true, completion: nil)
        }
    }

    func setupViews() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        leaderboardVC = sb.instantiateViewController(withIdentifier: "LeaderboardViewController") as! LeaderboardViewController
        profileVC = sb.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        self.addChildViewController(leaderboardVC)
        menuScrollView.addSubview(leaderboardVC.view)
        leaderboardVC.didMove(toParentViewController: self)
        leaderboardVC.view.frame.origin.x = self.view.frame.width
        
        self.addChildViewController(profileVC)
        menuScrollView.addSubview(profileVC.view)
        profileVC.didMove(toParentViewController: self)
        profileVC.view.frame.origin.x = self.view.frame.origin.x
        
        menuScrollView.contentSize = CGSize(width: self.view.frame.width * 2, height: self.view.frame.height)
        menuScrollView.setContentOffset(leaderboardVC.view.frame.origin, animated: false)
    }

}

