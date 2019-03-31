//
//  ViewController.swift
//  bull_eye2
//
//  Created by 캡디 on 01/04/2019.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
        // 버튼 눌렀을때 나오는 화면
        let alert = UIAlertController(title: "Hello, World",
                                      message: "This is my first app!",
                                      preferredStyle: .alert)
        //밑에 버튼 부분
        let action = UIAlertAction(title: "Awesome", style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

}

