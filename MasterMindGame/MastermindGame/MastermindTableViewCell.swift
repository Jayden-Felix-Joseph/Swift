//
//  MastermindTableViewCell.swift
//  MasterMindGameTwo
//
//  Created by Jayden Felix-Joseph on 08/11/2025.
//

import UIKit

class MastermindTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var imageViewOne: UIImageView!
    
    
    @IBOutlet weak var imageViewTwo: UIImageView!
    
    
    @IBOutlet weak var imageViewThree: UIImageView!
    
    
    
    @IBOutlet weak var imageViewFour: UIImageView!
    
    
    
    @IBOutlet weak var feedbackOne: UIImageView!
    
    
    
    @IBOutlet weak var feedbackTwo: UIImageView!
    
    
    @IBOutlet weak var feedbackFour: UIImageView!
    
    
    
    
    @IBOutlet weak var feedbackFive: UIImageView!
    

    



    

    
    func updateColour(index: Int, colourName: String) {
        let colourImage: [UIImageView?] = [imageViewOne, imageViewTwo, imageViewThree, imageViewFour]
        guard index >= 0 && index < colourImage.count else {return}
        colourImage[index]?.image = UIImage(named: colourName)
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
