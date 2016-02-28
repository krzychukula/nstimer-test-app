//
//  ViewController.swift
//  nstimer
//
//  Created by Krzysztof Kula on 28/02/16.
//  Copyright © 2016 Krzysztof Kula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelForBinaryCount: UILabel!
    var timer = NSTimer()
    var binaryCount = 0b0000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func start(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
    }
    
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        binaryCount = 0b0000
        
        updateText()
    }
    
    func countUp() {
        // if the counter reached max, reset it to 0
        if(binaryCount == 0b1111) {
            binaryCount = 0b0000
        }else{
            binaryCount += 0b0001
        }
        
        
        updateText()
    }
    
    func updateText() {
        var text = String(binaryCount, radix:2)
        
        //pad "0" to the left, to always have 4 digits
        for _ in 0..<4 - text.characters.count {
            text = "0" + text
        }
        
        labelForBinaryCount.text = text
    }
}

