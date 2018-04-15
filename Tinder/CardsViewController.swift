//
//  CardsViewController.swift
//  Tinder
//
//  Created by Henry Vuong on 4/15/18.
//  Copyright © 2018 Henry Vuong. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet var myView: UIView!
    @IBOutlet weak var tinderPic: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardInitialCenter = tinderPic.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            
        } else if sender.state == .changed {
            tinderPic.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
            if Int(translation.x) > 0 {
                tinderPic.transform = tinderPic.transform.rotated(by: CGFloat(0.5 * Double.pi / 180))
            } else {
                tinderPic.transform = tinderPic.transform.rotated(by: CGFloat(-0.5 * Double.pi / 180))
            }
        } else if sender.state == .ended {
            if Int(translation.x) > 50 {
                UIView.animate(withDuration: 0.5, animations: { () ->
                    Void in
                    self.tinderPic.center.x += 350
                })
            } else if Int(translation.x) < -50 {
                UIView.animate(withDuration: 0.5, animations: { () ->
                    Void in
                    self.tinderPic.center.x -= 350
                })
            } else {
                UIView.animate(withDuration: 0.5, animations: { () ->
                    Void in
                    self.tinderPic.center.y += self.cardInitialCenter.y - self.tinderPic.center.y
                    self.tinderPic.center.x += self.cardInitialCenter.x - self.tinderPic.center.x
                    self.tinderPic.transform = CGAffineTransform.identity
                })
            }
     
        }
    }

    @IBAction func didTapImage(_ sender: Any) {
        self.performSegue(withIdentifier: "Segue", sender: self)
    }
    
    
}
