//
//  MastermindColourPickTableViewCell.swift
//  MasterMindGameTwo
//
//  Created by Jayden Felix-Joseph on 09/11/2025.
//

import UIKit

protocol MastermindColourPickCellDelegate: AnyObject {
    func pickColour(colour: String, index: Int)
    func deselectColour(at index: Int)
    func confirmColours(colours: [String])
    func winGame()
}

class MastermindColourPickTableViewCell: UITableViewCell {
    weak var delegate: MastermindColourPickCellDelegate?
    
    var currIndex: Int = 0
    var colours: [String] = []


    @IBAction func blueButton(_ sender: Any) {
        guard currIndex < 4 else {return}
        delegate?.pickColour(colour: "blue", index: currIndex)
        currIndex = currIndex + 1
        colours.append ("blue")
        
    }
    
    
    @IBAction func greenButton(_ sender: Any) {
        guard currIndex < 4 else {return}
        delegate?.pickColour(colour: "green", index: currIndex)
        currIndex = currIndex + 1
        colours.append ("green")
    }
    
    
    @IBAction func greyButton(_ sender: Any) {
        guard currIndex < 4 else {return}
        delegate?.pickColour(colour: "grey", index: currIndex)
        currIndex = currIndex + 1
        colours.append ("grey")
    }
    
    
    @IBAction func orangeButton(_ sender: Any) {
        guard currIndex < 4 else {return}
        delegate?.pickColour(colour: "orange", index: currIndex)
        currIndex = currIndex + 1
        colours.append ("orange")
    }
    
    
    @IBAction func yellowButton(_ sender: Any) {
        guard currIndex < 4 else {return}
        delegate?.pickColour(colour: "yellow", index: currIndex)
        currIndex = currIndex + 1
        colours.append ("yellow")
    }
    
    
    @IBAction func pinkButton(_ sender: Any) {
        guard currIndex < 4 else {return}
        delegate?.pickColour(colour: "red", index: currIndex)
        currIndex = currIndex + 1
        colours.append ("red")
        
    }
    
    @IBAction func deselectColour(_ sender: Any) {
        guard currIndex > 0 else {return}
        currIndex -= 1
        delegate?.deselectColour(at: currIndex)
        colours.removeLast()
    }
    
    
    @IBAction func confirmButton(_ sender: Any) {
        delegate?.confirmColours(colours: colours)
        print(GData.shared.sequence)
        if GData.shared.sequence == colours{
            let duration = GData.shared.finishTime
            let win = GData.GameWins(date: Date(), duration: duration, position: GData.shared.mathTime ?? 0)
            GData.shared.gameWins.append(win)
            print(GData.shared.fileURL.path)
            GData.shared.saveWins()
            delegate?.winGame()
        }
    }
    
    
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

    
    
    

}

