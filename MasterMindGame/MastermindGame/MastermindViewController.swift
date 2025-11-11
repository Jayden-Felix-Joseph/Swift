//
//  MastermindViewController.swift
//  MasterMindGameTwo
//
//  Created by Jayden Felix-Joseph on 08/11/2025.
//

import UIKit

class MastermindViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MastermindColourPickCellDelegate {
    
    
    
    private var startTime: Date?
    private var timer: Timer?
    private var guesses: [[String]] = []
    
    func confirmColours(colours: [String]) {
        guesses.append(colours)
        tableView.reloadData()
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    func updateMainCellColour(with colour: String, index: Int){
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? MastermindTableViewCell{
            cell.updateColour(index: index, colourName: colour)
        }
    }
    
    func pickColour(colour: String, index: Int){
        updateMainCellColour(with: colour, index: index)
    }
    
    //code generating for code maker
    func codeGen(){
        var sequence: [String] = []
        //assign colours to a number in an array
        let numColour: [(colour: String, number: Int)] = [("red", 0), ("blue", 1), ("green", 2), ("yellow", 3), ("orange", 4), ("grey", 5)]
        //generate four colours
        for _ in 0..<4{
            //generate the sequence of four colours
            //let randInt = Int.random(in: 0..<numColour.count)
            sequence.append(numColour[Int.random(in: 0..<numColour.count)].colour)
        }
        GData.shared.sequence = sequence
    }
    
    
    
    
    
    
    //function for table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! MastermindTableViewCell
            //let colours = codeGen()
            //let feedback = ["black blob", "white blob", "white blob", "white blob"]
            
            //pass data to cell
            //cell.configure(colours: codeGen(), feedback: feedback)
            //print (codeGen())
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath) as! MastermindColourPickTableViewCell
            cell.delegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellThree", for: indexPath) as! MastermindGuessesTableViewCell
            var content = UIListContentConfiguration.cell()
            if indexPath.row - 2 < guesses.count {
                let guess = guesses[indexPath.row - 2]
                content.text = "Guess \(indexPath.row - 1): \(guess.joined(separator: ", "))"
            }else{
                content.text = "Guess \(indexPath.row - 1): "
            }
            cell.contentConfiguration = content
            return cell
            
        }
    }
    func startTimer(){
        startTime = Date()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] _ in
            guard let self = self, let startTime = self.startTime else {return}
            let timeElapsed = Date().timeIntervalSince(startTime)
            let mins = Int(timeElapsed) / 60
            let secs = Int(timeElapsed) % 60
            self.timerLabel.text = String(format: "%02d:%02d", mins, secs)
            timerLabel.isHidden = false
            GData.shared.finishTime = String(format: "%02d:%02d", mins, secs)
            GData.shared.mathTime = timeElapsed
        }
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        startTimer()
        codeGen()
    }
    
    func deselectColour(at index: Int) {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? MastermindTableViewCell {
            cell.updateColour(index: index, colourName: "AccentColour")
        }
    }
    
    func winGame() {
        NotificationCenter.default.post(name: NSNotification.Name("Player Won"), object: nil)
        let alert = UIAlertController(title: "WIN!", message: "YOU GUESSED CORRECTLY", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in self.navigationController?.popViewController(animated: true)
        })
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        timerLabel.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    deinit {
        timer?.invalidate()
    }
    
}
