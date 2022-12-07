//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    let eggTimes = ["Soft": 5, "Medium": 6, "Hard": 7]
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        
        if secondsPassed < totalTime
        {
            timerLabel.text = String(secondsPassed)
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
           
            print(Float(secondsPassed) / Float(totalTime))
            print(Float(secondsPassed / totalTime))
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
}
