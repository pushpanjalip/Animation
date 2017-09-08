//
//  RoundButton.swift
//  AnimationChaining
//
//  Created by Pushpanjali Pawar on 7/25/17.
//  Copyright © 2017 pushpanjali. All rights reserved.
//

import UIKit

@IBDesignable   //this will enable to add button directly to the Interface builder
class RoundButton: UIButton {

    //@IBInspectable will allow property to be shown in attribute inspector
    @IBInspectable var cornerRadius:CGFloat = 0{
        //didSet will be called whenever corner radius is set in attribute inspector
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor = .clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }


}
