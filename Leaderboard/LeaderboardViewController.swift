//
//  LeaderboardViewController.swift
//  Leaderboard
//
//  Created by Raquel Bonilla on 7/1/17.
//  Copyright © 2017 Raquel Bonilla. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var leaderboardTableView: UITableView!
    
    let players: [String] = ["Stefan", "Rocki", "Collin", "Joey"]
    let scores: [Int] = [10, 9, 8, 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardTableView.dataSource = self
        leaderboardTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaderboardTableView.dequeueReusableCell(withIdentifier: "PlayerScoreCell") as! PlayerScoreTableViewCell
        cell.nameLabel!.text = players[indexPath.row]
        cell.scoreLabel!.text = String(scores[indexPath.row])
        return cell
    }
    
    @IBAction func addEntry(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let entryVC = sb.instantiateViewController(withIdentifier: "EntryViewController") as! EntryViewController
        let navVC = UINavigationController(rootViewController: entryVC)
        self.present(navVC, animated: true, completion: nil)
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
