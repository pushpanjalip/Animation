//
//  ViewController.swift
//  AnimationChaining
//
//  Created by Pushpanjali Pawar on 7/25/17.
//  Copyright © 2017 pushpanjali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DescLabel: UILabel!
    @IBOutlet weak var GoButton: RoundButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backImage.alpha = 0
        TitleLabel.alpha = 0
        DescLabel.alpha = 0
        GoButton.alpha = 0
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 1, animations: { 
            self.backImage.alpha = 0.8
        }) { (true) in
            self.animateTitle()
        }
    }
    func animateTitle(){
        UIView.animate(withDuration: 1, animations: {
            self.TitleLabel.alpha = 1
        }) { (true) in
            self.animateDescLabel()
        }
    }
    func animateDescLabel(){
        UIView.animate(withDuration: 1, animations: {
            self.DescLabel.alpha = 1
        }) { (true) in
            self.animateButton()
        }
    }
    func animateButton(){
        UIView.animate(withDuration: 1.5) {
            self.GoButton.alpha = 1
        }
    }
}

