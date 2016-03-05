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
    
    enum Operation: String {
        case Divide = "/"
        case Multiple = "x"
        case Add = "+"
        case substract = "-"
        case Empty = "Empty"
        
    }
    
    @IBOutlet weak var outPutLb1: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    var currentRunningNum = ""
    var leftNum = ""
    var rightNum = ""
    var Result = ""
    var currentOperation: Operation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)

        do{
           try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
            
        }
        
    }

     @IBAction func numPressed(btn: UIButton!){
        playSound()
        currentRunningNum += "\(btn.tag)"
        outPutLb1.text = currentRunningNum
    }

    
    @IBAction func onPressedDiviBtn(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onPressedMulBtn(sender: AnyObject) {
        processOperation(Operation.Multiple)
    }

    @IBAction func onPressedSubBtn(sender: AnyObject) {
        processOperation(Operation.substract)
    }

    @IBAction func onPressedAddBtn(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onPressedEqualBtn(sender: AnyObject) {
        processOperation(currentOperation)
    }

    func processOperation(op: Operation){
        playSound()
        
        if currentOperation != Operation.Empty{
            //run some math
            // user selected an operator, but then selected another operator without 
            //first enter a number
            if currentRunningNum != "" {
                rightNum = currentRunningNum
                currentRunningNum = ""
                
                if currentOperation == Operation.Multiple{
                    Result = "\(Double(leftNum)! * Double(rightNum)!)"
                }else if currentOperation == Operation.Divide{
                    Result = "\(Double(leftNum)! / Double(rightNum)!)"
                }else if currentOperation == Operation.Add{
                    Result = "\(Double(leftNum)! + Double(rightNum)!)"
                }else if currentOperation == Operation.substract{
                    Result = "\(Double(leftNum)! - Double(rightNum)!)"
                }
                
                leftNum = Result
                outPutLb1.text = Result
            }
            
            currentOperation = op 
            
        }else{
            //this is the first time an operator has been pressed
            leftNum = currentRunningNum
            currentRunningNum = ""
            currentOperation = op
        }
    }
    func playSound(){
        if btnSound.playing{
            btnSound.stop()
        }
        btnSound.play()
    }


}
