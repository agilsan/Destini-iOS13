//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    var userChoice : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        let nextStory = storyBrain.nextStory(userChoice: userChoice)
        storyLabel.text = nextStory.title
        choice1Button.setTitle(nextStory.choice1, for: UIControl.State.normal)
        choice2Button.setTitle(nextStory.choice2, for: UIControl.State.normal)
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        userChoice = (sender.titleLabel?.text)!
        updateUI()
    }
    
}

