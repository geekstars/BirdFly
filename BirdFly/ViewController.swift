//
//  ViewController.swift
//  BirdFly
//
//  Created by Hoàng Minh Thành on 8/25/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var bird = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()

    }
    func drawJungle()
    {
        let background = UIImageView(image: UIImage(named: "forest.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
    }
    func addBird()
    {
        bird = UIImageView(frame:CGRectMake(0, 0, 110, 68))
        bird.animationImages = [UIImage(named:"bird1.png")!,UIImage(named:"bird2.png")!,UIImage(named:"bird3.png")!,UIImage(named:"bird4.png")!]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    func flyUpAndDown(){
        UIView.animateWithDuration(6, animations: {
            self.bird.center = CGPointMake(self.view.bounds.size.width-50,self.view.bounds.size.height-50)
        }) {(finished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(25))
            UIView.animateWithDuration(3, animations: {
                self.bird.center = CGPointMake(50, self.view.bounds.size.height-50)
            }) { (finished) in
                self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(25))
                UIView.animateWithDuration(6, animations: {
                    self.bird.center = CGPointMake(self.view.bounds.size.width-50,50)
                }) { (finished) in
                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(220))
                    UIView.animateWithDuration(3, animations: {
                        self.bird.center = CGPointMake(30, 50)
                        
                    }) { (finished) in
                        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(25))
                        self.bird.transform = CGAffineTransformIdentity
                        self.flyUpAndDown()
                    }
                }
            }
        }
    }
    var audio = AVAudioPlayer()
    func playSong()
    {
        
        audio = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bird", ofType: ".mp3")!))
        audio.prepareToPlay()
        audio.numberOfLoops = -1
        audio.play()
    }
}

