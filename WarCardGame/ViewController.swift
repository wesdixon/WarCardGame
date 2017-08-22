//
//  ViewController.swift
//  WarCardGame
//
//  Created by Wes Dixon on 8/22/17.
//  Copyright © 2017 WesDixon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftCard: UIImageView!
    @IBOutlet weak var rightCard: UIImageView!
    @IBOutlet weak var leftScore: UILabel!
    @IBOutlet weak var rightScore: UILabel!
    
    let allCards = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]
    
    var leftScoreAmount = 0
    var rightScoreAmount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dealTapped(_ sender: UIButton) {
        
        // Generate random number to assign left card with
        let leftNumber = Int(arc4random_uniform(13))
        leftCard.image = UIImage(named: allCards[leftNumber])
        
        // Generate random number to assign right card with
        let rightNumber = Int(arc4random_uniform(13))
        rightCard.image = UIImage(named: allCards[rightNumber])
        
        // Check to see who won that round
        
        if leftNumber > rightNumber {
            
            // Player won that round
            // Update the left score
            leftScoreAmount += 1
            leftScore.text = String(leftScoreAmount)
        }
        else if leftNumber == rightNumber {
            
            // Player and CPU tied
        }
        else {
            
            //CPU Won
            // Update the right score
            rightScoreAmount += 1
            rightScore.text = String(rightScoreAmount)
        }
        
    }

}

