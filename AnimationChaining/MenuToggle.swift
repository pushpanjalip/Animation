//
//  MenuToggle.swift
//  AnimationChaining
//
//  Created by Pushpanjali Pawar on 7/25/17.
//  Copyright © 2017 pushpanjali. All rights reserved.
//

import UIKit

class MenuToggle: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var darkFillView: RoundView!
    @IBOutlet weak var toggleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func toggle(_ sender: Any) {
        //We have to check if view is transformed previously
        if (darkFillView.transform == .identity){
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = CGAffineTransform(scaleX: 11, y: 11)
                self.menuView.transform = CGAffineTransform(translationX: 0, y: -67)
            }) { (true) in
                
            }
        }
        else{
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = .identity
                self.menuView.transform = .identity
            }, completion: { (true) in
                
            })
        }

    }
}
