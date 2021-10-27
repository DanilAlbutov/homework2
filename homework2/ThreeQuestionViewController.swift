//
//  ThreeQuestionViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class ThreeQuestionViewController: UIViewController {

    var questionsContainer: QwuestionBuilder!
    var resultAns = ""
    var rightAns = "Чаусĸи"
    
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet var answerButtonList: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        let tempObj = OneQuestionViewController()
        if sender == buttonNext {
            tempObj.saveQuestion(queCont: questionsContainer, rightAnswer: rightAns, resultAnswer: resultAns, btnArr: answerButtonList, img: questionImage)
        } else {
            
            resultAns = tempObj.changeButtonState(btnArr: answerButtonList, button: sender)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromThreeToFourQuestion" {
                    if let question4Controller = segue.destination as?  FourQuestionViewController{
                        question4Controller.questionsContainer = self.questionsContainer
                    }
                }
    }


}
