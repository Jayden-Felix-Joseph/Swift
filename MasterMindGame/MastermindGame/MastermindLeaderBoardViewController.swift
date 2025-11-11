//
//  MastermindLeaderBoardViewController.swift
//  MasterMindGameTwo
//
//  Created by Jayden Felix-Joseph on 11/11/2025.
//

import UIKit

class MastermindLeaderBoardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var leaderBoard: UITableView!
    

    var wins: [GData.GameWins] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return (wins.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderBoard", for: indexPath)
        var content = UIListContentConfiguration.cell()
        let win = wins[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        content.text = "****\(indexPath.row + 1)****\n\(formatter.string(from: win.date))"
        
        
        
        //content.text = wins[indexPath.row].0
        cell.contentConfiguration = content
        return cell
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        leaderBoard.dataSource = self
        leaderBoard.delegate = self
        
        GData.shared.displayWins()
        wins = GData.shared.gameWins
        leaderBoard.reloadData( )


        // Do any additional setup after loading the view.
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
