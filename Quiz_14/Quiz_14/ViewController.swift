//
//  ViewController.swift
//  Quiz_14
//
//  Created by 이민우 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func btnMoveTimer(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMovePageControl(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
}

