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
    
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!// 초록색 중의 -- value값 가짐
    @IBOutlet weak var targetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
    }
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let message = "You scored \(points) point"
        // 버튼 눌렀을때 나오는 화면
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        //밑에 버튼 부분
        let action = UIAlertAction(title: "O.K", style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()// 버튼 누를떄 마다 실행되게함
    }
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue = lroundf(slider.value)// score of slider
        print("The value of the slider is now: \(currentValue)")
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        
    }
}
    


