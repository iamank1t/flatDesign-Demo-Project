//
//  signInVC.swift
//  FlatDesignDemo
//
//  Created by Ankit Singh on 18/08/19.
//  Copyright © 2019 Ankit Singh. All rights reserved.
//

import UIKit

protocol signInDelegate {
    func swipeToNext()
}

class signInVC: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    
    var delegate: signInDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adds gradient view to button
        self.signInButton.applyGradient(colors: [UIColor.init(red: 157/255, green: 216/255, blue: 19/255, alpha: 1.0).cgColor, UIColor.init(red: 157/255, green: 216/255, blue: 19/255, alpha: 0.8).cgColor])
        self.signInButton.clipsToBounds = true
        self.signInButton.layer.cornerRadius = 6.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if self.delegate != nil {
            delegate?.swipeToNext()
        }
    }
    
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController = mainStoryBoard.instantiateViewController(withIdentifier: "mainNavigationController") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
}
