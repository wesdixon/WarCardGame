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
    
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    let allCards = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]
    
    var leftScoreAmount = 0
    var rightScoreAmount = 0
    
    var timer:Timer?
    var countdown = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set timer label
        timerLabel.text = String(countdown)
        
        // Initialize timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired(_:)), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Timer triggered function
    func timerFired(_ timerThatFired:Timer) {
        
        if countdown == 0 {
            
            // Stop the timer
            timer?.invalidate()
            
            // See who won the game, so info can be used in alert
            var messageString = ""
            
            if leftScoreAmount > rightScoreAmount {
                messageString = "Player won!"
            }
            else if leftScoreAmount < rightScoreAmount {
                messageString = "CPU won!"
            }
            else {
                messageString = "It's a tie!"
            }
            
            // Create alert
            
            let alert = UIAlertController(title: "Done!", message: messageString, preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okButton)
            
            // Present the alert
            present(alert, animated: true, completion: nil)
            
            // Invalidate the button so game cannot continue
            dealButton.isEnabled = false
            
            return
        }
        
        countdown -= 1
        
        // Update the timer label
        
        timerLabel.text = String(countdown)
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

