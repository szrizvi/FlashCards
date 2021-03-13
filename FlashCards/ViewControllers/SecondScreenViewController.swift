//
//  SecondScreenViewController.swift
//  FlashCards
//
//  Created by Zainab Rizvi on 06/03/2021.
//

import UIKit

class SecondScreenViewController: UIViewController {
    var FlashcardsController: FirstScreenViewController!

    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        let answer1Text = answerTextField.text
        let answer2Text = answer2TextField.text
        let answer3Text = answer3TextField.text
        
        FlashcardsController.updateFlashcard(question: questionText!, answer1: answer1Text!, answer2: answer2Text!, answer3: answer3Text!)
        dismiss(animated: true)
    }
}
