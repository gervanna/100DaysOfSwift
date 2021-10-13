//
//  ViewController.swift
//  Project2
//
//  Created by Gervanna Stephens on 2021-10-10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SCORE", style: .plain, target: self, action: #selector(currentScore))
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
       
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        questionsAsked += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Incorrect. That's the flag of \(countries[sender.tag])."
            score -= 1
        }
        
        if questionsAsked < 10 {
            let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
            present(ac, animated: true)
        } else {
            let ac2 = UIAlertController(title: "Game Over.", message: "Your final score is \(score).", preferredStyle: .alert)
        
            ac2.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
        
            present(ac2, animated: true)
            
            score = 0
            questionsAsked = 0
        }
    }
    
    @objc func currentScore() {
        let showScore = UIAlertController(title: "Your current score is \(score)", message: nil, preferredStyle: .alert)
        showScore.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(showScore, animated: true)
    }
}

