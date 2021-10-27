//
//  TwoQuestionViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class TwoQuestionViewController: UIViewController {

    var questionsContainer: QwuestionBuilder!
    var resultAns = ""
    var rightAns = "Лабрадудль"
    
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet var answerButtonList: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        let tempObj = OneQuestionViewController()
        if sender == buttonNext {
            tempObj.saveQuestion(rightAnswer: rightAns, resultAnswer: resultAns, btnArr: answerButtonList, img: questionImage)
        } else {
            
            tempObj.changeButtonState(btnArr: answerButtonList, button: sender)
        }
        
    }

}
