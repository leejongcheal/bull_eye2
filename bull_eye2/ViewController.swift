//
//  ViewController.swift
//  bull_eye2
//
//  Created by 캡디 on 01/04/2019.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!// 초록색 중의 -- value값 가짐
    @IBOutlet weak var targetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //startNewRound()
        startNewGame()
    }
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let message = "You scored \(points) point"
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        
        // 버튼 눌렀을때 나오는 화면
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        //밑에 버튼 부분
        let action = UIAlertAction(title: title, style: .default,
                                   handler: {_ in self.startNewRound()
                                    })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        //startNewRound()// 버튼 누를떄 마다 실행되게함
    }
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue = lroundf(slider.value)// score of slider
        print("The value of the slider is now: \(currentValue)")
    }
    @IBAction func startNewGame(){
        round = 0
        score = 0
        startNewRound()
    }
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
    


