//  ToggleMenuController.swift
//  AnimationChaining
//
//  Created by Pushpanjali Pawar on 7/26/17.
//  Copyright © 2017 pushpanjali. All rights reserved.
//

import UIKit

class ToggleMenuController: UIViewController {
    var stackView:UIStackView?
    var buttonsArray:[UIButton]=[]
    var backImage:UIImageView={
        let imageView = UIImageView()
        imageView.image = UIImage(named: "strawberriesBack")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var menuView:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints  = false
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return  view
    }()
    var darkFillView:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints  = false
        view.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
        view.layer.cornerRadius = 35
        view.isUserInteractionEnabled = false
        return view
    }()
    lazy var toggleButton:UIButton={
        let button = UIButton(type: UIButtonType.custom)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named:"up"), for: .normal)
        button.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backImage)
        self.view.addSubview(menuView)
        stackView = getStackView()
        setUpBackImage()
        setUpMenuView()
        print(menuView.bounds.size.height)
       
    }
           
}
