//
//  RoundView.swift
//  AnimationChaining
//
//  Created by Pushpanjali Pawar on 7/25/17.
//  Copyright © 2017 pushpanjali. All rights reserved.
//

import UIKit
@IBDesignable
class RoundView: UIView {
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }

}
