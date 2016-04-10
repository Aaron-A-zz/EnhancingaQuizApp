//
//  ViewController.swift
//  EnhancingaQuizApp
//
//  Created by Aaron on 4/9/16.
//  Copyright © 2016 Aaron Ackerman. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var startButon: UIButton!
    var getQuestions: Questions!
    var correctAnswers = 0
    var questionCount = -1
    var gameSound: SystemSoundID = 1
    @IBOutlet weak var currentScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Do any additional setup after loading the view, typically from a nib.
        buttonOne.hidden = true
        buttonTwo.hidden = true
        buttonThree.hidden = true
        buttonFour.hidden = true
        currentScore.hidden = true
        questionLabel.text = "Ready to start?"
        
    }

    @IBAction func checkAnswer(sender: UIButton) {
        
        disableButtoninteraction()
        
        if sender.titleLabel!.text == getQuestions.answer {
            correctAnswers += 1
            currentScore.text = "Correct answers: \(correctAnswers) of \(questionArray.count - 1)"
            questionLabel.text = "That's Correct!"
            sender.setTitleColor(UIColor(red: 15/225, green: 180/225, blue: 105/225, alpha: 1.0), forState: UIControlState.Normal)
            playCorrectSounds()
        } else {
            playWrongSounds()
            sender.setTitleColor(UIColor(red: 226/225, green: 69/225, blue: 76/225, alpha: 1.0), forState: UIControlState.Normal)
            questionLabel.text = ":( Nice try."
        }
       loadNextQuestions(seconds: 2)
    }
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        questionCount = 0
        playGameStartSound()
        displayQuestion()
        startButon.hidden = true
        currentScore.hidden = false
        correctAnswers = 0
        currentScore.text = "Correct answers: \(correctAnswers) of \(questionArray.count - 1)"
    }
    
    func loadNextQuestions(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.displayQuestion()
            self.resetButtoncolors()
            self.enableButtoninteraction()
        }
    }
    
    func displayQuestion(){
        
        buttonOne.hidden = false
        buttonTwo.hidden = false
        buttonThree.hidden = false
        buttonFour.hidden = false
        
        //get random questions
        if questionCount == questionArray.count - 1 {
            questionCount = 0
            endGame()
            
        } else {
            print(questionCount)
            getQuestions = questionArray[questionCount]
            
            // hide any buttons that dont apply to the current question.
            
            if getQuestions.option.optionOne == "" {
                buttonOne.hidden = true
            }
            
            if getQuestions.option.optionTwo == "" {
                buttonTwo.hidden = true
            }
            
            if getQuestions.option.optionThree == "" {
                buttonThree.hidden = true
            }
            
            if getQuestions.option.optionFour == "" {
                buttonFour.hidden = true
            }
            
            //assign questions & answers to each button
            questionLabel.text = getQuestions.question
            buttonOne.setTitle(getQuestions.option.optionOne, forState: UIControlState.Normal)
            buttonTwo.setTitle(getQuestions.option.optionTwo, forState: UIControlState.Normal)
            buttonThree.setTitle(getQuestions.option.optionThree, forState: UIControlState.Normal)
            buttonFour.setTitle(getQuestions.option.optionFour, forState: UIControlState.Normal)
            questionCount += 1
        }
        
    }
    
    func resetButtoncolors(){
        //reset button colors
        buttonOne.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonTwo.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonThree.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonFour.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    func endGame() {
        questionLabel.text = "You scored \(correctAnswers) of \(questionArray.count - 1) would you like to try again?"
        buttonOne.hidden = true
        buttonTwo.hidden = true
        buttonThree.hidden = true
        buttonFour.hidden = true
        startButon.hidden = false
        currentScore.hidden = true
        correctAnswers = 0
        
    }
    
    func disableButtoninteraction() {
        //prevents a bug that allows the user to select more than one answer
        buttonOne.userInteractionEnabled = false
        buttonTwo.userInteractionEnabled = false
        buttonThree.userInteractionEnabled = false
        buttonFour.userInteractionEnabled = false
    }
    
    func enableButtoninteraction() {
        buttonOne.userInteractionEnabled = true
        buttonTwo.userInteractionEnabled = true
        buttonThree.userInteractionEnabled = true
        buttonFour.userInteractionEnabled = true
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func playWrongSounds() {
        if let soundURL = NSBundle.mainBundle().URLForResource("wrong", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound);
        }
    }
    
    func playCorrectSounds() {
        if let soundURL = NSBundle.mainBundle().URLForResource("correct", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

