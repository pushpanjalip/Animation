//
//  SwipingCard.swift
//  AnimationChaining
//
//  Created by Pushpanjali Pawar on 7/26/17.
//  Copyright © 2017 pushpanjali. All rights reserved.
//

import UIKit

class SwipingCard: UIViewController {

    @IBOutlet weak var thumImageView: UIImageView!
    @IBOutlet weak var cardImage: UIImageView!
    var divisor:CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    
    
    @IBAction func reset(_ sender: Any) {
        resetButton()
    }
    
    @IBAction func handleSwipe(_ sender: UIPanGestureRecognizer) {
        divisor = (view.frame.width/2)/0.61  //35 degrees = 0.61 radiant
        let card = sender.view
        let point = sender.translation(in: view)
        let xFromCenter = (card?.center.x)! - view.center.x
        card?.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        let scale = min(100/abs(xFromCenter), 1)
        card?.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        if(xFromCenter > 0){
            thumImageView.image = #imageLiteral(resourceName: "like")
            thumImageView.tintColor = .green
    
            
        }
        else{
            thumImageView.image = #imageLiteral(resourceName: "dislike")
            thumImageView.tintColor = .red
            
        }
        
        thumImageView.alpha = abs(xFromCenter / view.center.x)
        if sender.state == UIGestureRecognizerState.ended{
            if CGFloat((card?.center.x)!) < 75{
                //Move off to left
                UIView.animate(withDuration: 0.3, animations: { 
                    card?.center = CGPoint(x: (card?.center.x)! - 200, y: card!.center.y + 75)
                    card?.alpha = 0
                    self.thumImageView?.alpha = 0
                })
                return
            }
            else if (card?.center.x)! > (view.frame.width - 75){
                //Move off to right
                UIView.animate(withDuration: 0.3, animations: {
                    card?.center = CGPoint(x: (card?.center.x)! + 200, y: card!.center.y + 75)
                    card?.alpha = 0
                    self.thumImageView.alpha = 0
                })
                return
            }
           resetButton()
        }
        
    }
    func resetButton(){
        UIView.animate(withDuration: 0.2, animations: {
            self.cardImage.center = self.view.center
            self.thumImageView.alpha = 0
            self.cardImage.alpha = 1
            self.cardImage.transform = .identity
        })
    }
}
