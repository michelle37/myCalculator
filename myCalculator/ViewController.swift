//
//  ViewController.swift
//  myCalculator
//
//  Created by Michelle Lee on 3/2/16.
//  Copyright © 2016 Michelle Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outPutLb1: UILabel!
    
    var btnSound: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "war")
        let soundUrl = NSURL(fileURLWithPath: path!)

        do{
           try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
            
        }
        
    }

     @IBAction func numPressed(sender: UIButton){
        btnSound.play()
    }


    @IBAction func onPressedEqualBtn(sender: AnyObject) {
    }
    
    @IBAction func onPressedDiviBtn(sender: AnyObject) {
        
    }
    
    @IBAction func onPressedMulBtn(sender: AnyObject) {
    }

    @IBAction func onPressedSubBtn(sender: AnyObject) {
    }

    @IBAction func onPressedAddBtn(sender: AnyObject) {
    }





}
