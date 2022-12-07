//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 60
    
    @IBOutlet weak var timerLabel: UILabel!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @objc func updateCounter() {
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        //example functionality
        if counter > 0 {
            counter -= 1
        }
        timerLabel.text = String(counter)
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        print(eggTimes[hardness]!)
        
        updateCounter()
    }
    
}
