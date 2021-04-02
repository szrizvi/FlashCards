//
//  ViewController.swift
//  FlashCards
//
//  Created by Zainab Rizvi on 20/02/2021.
//

import UIKit

struct Flashcard {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    
}

class FirstScreenViewController: UIViewController {

    @IBOutlet weak var FrontLabel: UILabel!
    @IBOutlet weak var BackLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var OptionOne: UIButton!
    @IBOutlet weak var OptionTwo: UIButton!
    @IBOutlet weak var OptionThree: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! SecondScreenViewController
        creationController.FlashcardsController = self
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readSavedFlashcards()
        // Do any additional setup after loading the view.
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        FrontLabel.layer.cornerRadius = 20.0
        FrontLabel.clipsToBounds = true
        
        BackLabel.layer.cornerRadius = 20.0
        BackLabel.clipsToBounds = true
        
        OptionOne.layer.borderWidth = 3.0
        OptionOne.layer.borderColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        OptionOne.layer.cornerRadius = 20.0
        
        OptionTwo.layer.borderWidth = 3.0
        OptionTwo.layer.borderColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        OptionTwo.layer.cornerRadius = 20.0
        
        OptionThree.layer.borderWidth = 3.0
        OptionThree.layer.borderColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        OptionThree.layer.cornerRadius = 20.0
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What's the capital of Pakistan?", answer1: "Lahore", answer2: "Islamabad", answer3: "Karachi")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
    }


    @IBAction func didTapOnOne(_ sender: Any) {
        OptionOne.isHidden = true
    }
    @IBAction func didTapOnTwo(_ sender: Any) {
        flipFlashcard()
        
    }
    @IBAction func didTapOnThree(_ sender: Any) {
        OptionThree.isHidden = true
    }
    @IBAction func didTapOnAnswer(_ sender: Any) {
        if FrontLabel.isHidden == true {
        FrontLabel.isHidden = false
    }
    }
    
    @IBAction func didTapOnQuestion(_ sender: Any) {
        flipFlashcard()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateNextPrevButtons()
        animateCardIn()
    }
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        animateCardOut()
        updateNextPrevButtons()
    }
    
    func flipFlashcard(){
        FrontLabel.isHidden = true
        UIView.transition(with: card, duration: 0.3, options: UIView.AnimationOptions.transitionFlipFromRight, animations: {
            self.FrontLabel.isHidden = true
        })
    }
    
    func animateCardOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity.translatedBy(x: -300, y: 0)}, completion: {finished in
                self.updateLabels()
                self.animateCardIn()
            })
    }
    
    func animateCardIn(){
        card.transform = CGAffineTransform.identity.translatedBy(x: 300, y: 0)
        UIView.animate(withDuration: 0.3) {
            self.card.transform = CGAffineTransform.identity
        }
        updateLabels()
            }
    func updateFlashcard(question: String, answer1: String, answer2: String, answer3: String) {
        let flashcard = Flashcard(question: question, answer1: answer1, answer2: answer2, answer3: answer3)
        
        OptionOne.setTitle(answer1, for: .normal)
        OptionTwo.setTitle(answer2, for: .normal)
        OptionThree.setTitle(answer3, for: .normal)
        
        flashcards.append(flashcard)
        print("Added new flashcard 😎")
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        saveAllFlashcardsToDisk()
        updateLabels()
    
    }
    
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        FrontLabel.text = currentFlashcard.question
        BackLabel.text = currentFlashcard.answer2
        
        OptionOne.setTitle(currentFlashcard.answer1, for: .normal)
        OptionTwo.setTitle(currentFlashcard.answer2, for: .normal)
        OptionThree.setTitle(currentFlashcard.answer3, for: .normal)
        
        
    }

    
        
    func saveAllFlashcardsToDisk() {
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer2]}
            
        UserDefaults.standard.set(flashcards, forKey: "flashcards")
        print("Flashcards saved to UserDefaults")
        
    }
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer1: dictionary["answer1"]!, answer2: dictionary["answer"]!, answer3: dictionary["answer3"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
}

}
