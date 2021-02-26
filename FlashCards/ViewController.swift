//
//  ViewController.swift
//  FlashCards
//
//  Created by Zainab Rizvi on 20/02/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FrontLabel: UILabel!
    @IBOutlet weak var BackLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var OptionOne: UIButton!
    @IBOutlet weak var OptionTwo: UIButton!
    @IBOutlet weak var OptionThree: UIButton!
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }


    @IBAction func didTapOnOne(_ sender: Any) {
        OptionOne.isHidden = true
    }
    @IBAction func didTapOnTwo(_ sender: Any) {
        FrontLabel.isHidden = true
    }
    @IBAction func didTapOnThree(_ sender: Any) {
        OptionThree.isHidden = true
    }
    
}
