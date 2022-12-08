//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        
        if secondsPassed < totalTime
        {
            timerLabel.text = "Os ovos demoraram \(secondsPassed + 1) segundos a serem cozinhados."
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}

