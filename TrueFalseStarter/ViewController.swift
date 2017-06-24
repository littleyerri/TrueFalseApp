//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    // Contant to set the required questions asked per round
    let questionsPerRound: Int = 5
    
    // Variables for aksed and correct questions per round
    var questionsAsked:   Int = 0
    var correctQuestions: Int = 0
    
    // Variable for sound
    var gameSound: SystemSoundID = 0
    
    // Labels
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var messageField:  UILabel!
    
    // Buttons
    @IBOutlet weak var nextQuestionButton:    UIButton!
    @IBOutlet weak var playAgainButton:       UIButton!
    @IBOutlet weak var optionOne:             UIButton!
    @IBOutlet weak var optionTwo:             UIButton!
    @IBOutlet weak var optionThree:           UIButton!
    @IBOutlet weak var optionFour:            UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        
        // Start game
        playGameStartSound()
        initialAppSetUp()
        displayQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Initial app set up
    func initialAppSetUp() {
        // Hide
        messageField.isHidden = true
        
        nextQuestionButton.isHidden = true
        playAgainButton.isHidden    = true
        
        // Show
        optionOne.isHidden   = false
        optionTwo.isHidden   = false
        optionThree.isHidden = false
        optionFour.isHidden  = false
        
        // Corner radius
        optionOne.layer.cornerRadius          = 6
        optionTwo.layer.cornerRadius          = 6
        optionThree.layer.cornerRadius        = 6
        optionFour.layer.cornerRadius         = 6
        playAgainButton.layer.cornerRadius    = 6
        nextQuestionButton.layer.cornerRadius = 6
        
        // Alpha
        optionOne.alpha   = 1.0
        optionTwo.alpha   = 1.0
        optionThree.alpha = 1.0
        optionFour.alpha  = 1.0
        
        generateQuestionsToIndex()
    }
    
    func displayQuestion() {
        selectNextQuestion()
        
        questionField.text = questions[indexOfQuestions].question
        
        optionOne.setTitle(questions[indexOfQuestions].options[1], for: .normal)
        optionTwo.setTitle(questions[indexOfQuestions].options[2], for: .normal)
        optionThree.setTitle(questions[indexOfQuestions].options[3], for: .normal)
        optionFour.setTitle(questions[indexOfQuestions].options[4], for: .normal)
        
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        optionOne.isHidden   = true
        optionTwo.isHidden   = true
        optionThree.isHidden = true
        optionFour.isHidden  = true
        
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\n\n" + "You got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        questionsAsked += 1
        
        let correctAnswer = questions[indexOfQuestions].answer
        
        if (sender === optionOne && correctAnswer == 1) || (sender === optionTwo && correctAnswer == 2) || (sender === optionThree && correctAnswer == 3) || (sender === optionFour && correctAnswer == 4) {
            correctQuestions += 1
            
            messageField.isHidden  = false
            messageField.textColor = UIColor.yellow
            messageField.text      = "Good Job!"
            
            optionOne.alpha   = 0.5
            optionTwo.alpha   = 0.5
            optionThree.alpha = 0.5
            optionFour.alpha  = 0.5
            
            sender.alpha = 1.0
        } else {
            messageField.isHidden = false
            messageField.textColor = UIColor.red
            messageField.text = "Sorry, Wrong Answer!"
        }
        
        nextQuestionButton.isHidden = false
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game over
            displayScore()
            
            nextQuestionButton.isHidden = true
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        optionOne.isHidden   = false
        optionTwo.isHidden   = false
        optionThree.isHidden = false
        optionFour.isHidden  = false
        
        messageField.isHidden = true
        
        questionsAsked   = 0
        correctQuestions = 0
        
        nextRound()
    }
    
    @IBAction func nextQuestion() {
        initialAppSetUp()
        
        return loadNextRoundWithDelay(seconds: 0)
    }
    
    // Helper methods
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}
