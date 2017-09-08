//
//  ToggleMenuExtension.swift
//  AnimationChaining
//
//  Created by Pushpanjali Pawar on 7/26/17.
//  Copyright © 2017 pushpanjali. All rights reserved.
//

import UIKit
extension ToggleMenuController{
    func setUpBackImage(){
        backImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        backImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backImage.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        backImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    func setUpMenuView(){
        menuView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        menuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 67).isActive = true
        menuView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        menuView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/5).isActive = true
        self.menuView.addSubview(darkFillView)
        setUpDarkFillView()
        if let stackView = stackView {
        self.menuView.addSubview(stackView)
            setUpStackView()
        }
    }
    func setUpDarkFillView(){
        darkFillView.topAnchor.constraint(equalTo: menuView.topAnchor).isActive = true
        darkFillView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        darkFillView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        darkFillView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.menuView.addSubview(toggleButton)
        setUpToggleButton()
    }
    func setUpStackView(){
        if let stackView = stackView {
            stackView.leftAnchor.constraint(equalTo: self.menuView.leftAnchor, constant: 50).isActive = true
            stackView.bottomAnchor.constraint(equalTo: self.menuView.bottomAnchor, constant: -15).isActive = true
            stackView.rightAnchor.constraint(equalTo: self.menuView.rightAnchor, constant: -50).isActive = true
            stackView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
    }
    func setUpToggleButton(){
        toggleButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        toggleButton.centerYAnchor.constraint(equalTo: darkFillView.centerYAnchor).isActive = true
        toggleButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        toggleButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    func getradiance(_ degrees:Double) -> CGFloat{
        return CGFloat(degrees * .pi/degrees)
    }
    func createButtons(_ named:String...) -> [UIButton]{
        return named.map{ name in
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named:name), for: .normal)
            button.alpha = 0
            
            button.layer.cornerRadius = 45
            button.heightAnchor.constraint(equalToConstant: 90).isActive = true
            button.widthAnchor.constraint(equalToConstant: 90).isActive = true
            button.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
            button.tintColor = .white
            self.buttonsArray.append(button)
            return button
            
        }
    }
    func getStackView() -> UIStackView{
        let buttons = createButtons("fb","youTube","linkedIn","twitter")
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        //stackView.spacing = 30
        
        return stackView
    }
    func toggleMenu(){
        if(darkFillView.transform == .identity){
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = CGAffineTransform(scaleX: 21, y: 21)
                self.menuView.transform = CGAffineTransform(translationX: 0, y: -67)
                self.toggleButton.transform = CGAffineTransform(rotationAngle: self.getradiance(180))
            }) { (true) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.toggleButtons()
                })
            }
        }
        else{
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = .identity
                self.menuView.transform = .identity
                self.toggleButton.transform = .identity
                self.toggleButtons()
            })
        }
    }
    func toggleButtons(){
        for button in buttonsArray{
            let alpha = CGFloat(button.alpha == 0 ? 1 : 0)
            button.alpha = alpha
           
        }
    }
    

}
