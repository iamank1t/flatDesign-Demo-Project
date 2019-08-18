//
//  feedVC.swift
//  FlatDesignDemo
//
//  Created by Ankit Singh on 18/08/19.
//  Copyright © 2019 Ankit Singh. All rights reserved.
//

import UIKit

class feedVC: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "postCardCell", bundle: nil)
        self.postsTableView.register(nib, forCellReuseIdentifier: "postCardCell")
        // Do any additional setup after loading the view.
    }

}

extension feedVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCardCell", for: indexPath) as! postCardCell
        return cell
    }
}
