//
//  getStartedVC.swift
//  FlatDesignDemo
//
//  Created by Ankit Singh on 18/08/19.
//  Copyright © 2019 Ankit Singh. All rights reserved.
//

import UIKit

class getStartedVC: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.popIn()
        // Do any additional setup after loading the view.
    }    

}
