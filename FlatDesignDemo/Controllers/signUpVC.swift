//
//  signUpVC.swift
//  FlatDesignDemo
//
//  Created by Ankit Singh on 18/08/19.
//  Copyright © 2019 Ankit Singh. All rights reserved.
//

import UIKit

protocol signUpDelegate {
    func swipeToBack()
}

class signUpVC: UIViewController {
    
    @IBOutlet weak var registerAccountButton: UIButton!
    
    var delegate: signUpDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adds gradient view to button
        self.registerAccountButton.applyGradient(colors: [UIColor.init(red: 157/255, green: 216/255, blue: 19/255, alpha: 1.0).cgColor, UIColor.init(red: 157/255, green: 216/255, blue: 19/255, alpha: 0.8).cgColor])
        self.registerAccountButton.clipsToBounds = true
        self.registerAccountButton.layer.cornerRadius = 6.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIpButtonClicked(_ sender: Any) {
        
        if self.delegate != nil {
            delegate?.swipeToBack()
        }
    }
    
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController = mainStoryBoard.instantiateViewController(withIdentifier: "mainNavigationController") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
}
