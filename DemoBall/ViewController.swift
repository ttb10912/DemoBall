//
//  ViewController.swift
//  DemoBall
//
//  Created by TTB10912 on 14/09/2016.
//  Copyright © 2016 TTB10912. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    var toTheEnd:Bool = false
    var reverseRadians = CGFloat()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollingBall), userInfo: nil, repeats: true)
    
    }

    
    func addBall() {
        
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32.0
        ball.center = CGPointMake(ballRadious, mainViewSize.height/2 )
        self.view.addSubview(ball)
        
        
        
    }
    
    func rollingBall()  {
        
        var deltaAngle : CGFloat = 0.1
        radians = radians + deltaAngle
        reverseRadians = reverseRadians - deltaAngle
        
        
        print(self.ball.center.x)
        print(self.view.bounds.size.width - 32)
        
        
        if toTheEnd == false {
            
            
            if (self.ball.center.x  >=  28.0 ) {
                //bong lan
                self.ball.transform = CGAffineTransformMakeRotation(self.radians)
                
                //bong lan sang phai
                self.ball.center = CGPointMake(self.ball.center.x + self.ballRadious * deltaAngle , self.ball.center.y )
                
                if self.ball.center.x  >= self.view.bounds.size.width - 32 {
                    toTheEnd = true
                    
                }
            }
            
           
            
        }
        if toTheEnd == true {
            
            if ( self.ball.center.x  <= self.view.bounds.size.width - 30) {
                
                //bong lan NGUOC
                self.ball.transform = CGAffineTransformMakeRotation(self.reverseRadians)
                
                //lan qua trai
                self.ball.center = CGPointMake(self.ball.center.x  - self.ballRadious * deltaAngle , self.ball.center.y )
                
                if self.ball.center.x  <=  32 {
                    toTheEnd = false
                }
            }
           
            
        }
    }


}

