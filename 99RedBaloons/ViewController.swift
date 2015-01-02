//
//  ViewController.swift
//  99RedBaloons
//
//  Created by Александр Подрабинович on 02/01/15.
//  Copyright (c) 2015 Alex Podrabinovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var myBalloons:[Balloon] = []
    var currentBalloon = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var firstBall = Balloon()
        firstBall.balloonImage = UIImage(named: "1.jpg")
        firstBall.balloonNumber = 5
        
        var secondBall = Balloon()
        secondBall.balloonImage = UIImage(named: "2.jpg")
        secondBall.balloonNumber = 15
        
        var thirdBall = Balloon()
        thirdBall.balloonImage = UIImage(named: "3.jpg")
        thirdBall.balloonNumber = 25
        
        var fourthBall = Balloon()
        fourthBall.balloonImage = UIImage(named: "4.jpg")
        fourthBall.balloonNumber = 50
        
        myBalloons += [firstBall, secondBall, thirdBall, fourthBall]
        myImageView.image = myBalloons[currentBalloon].balloonImage
        numberLabel.text = "\(myBalloons[currentBalloon].balloonNumber)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextItemButtonPressed(sender: UIBarButtonItem) {
        var randomBalloon: Int
        do {
            randomBalloon = Int(arc4random_uniform(UInt32(myBalloons.count)))
        } while randomBalloon == currentBalloon
        
        currentBalloon = randomBalloon
        let currentItem = myBalloons[currentBalloon]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                self.myImageView.image = currentItem.balloonImage
                self.numberLabel.text = "\(currentItem.balloonNumber)"
            },
            completion: {
                (finished: Bool) -> () in
        })
    }

}

