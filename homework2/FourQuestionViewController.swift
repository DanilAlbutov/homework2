//
//  FourQuestionViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class FourQuestionViewController: UIViewController {

    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet var answerButtonList: [UIButton]!
    var questionsContainer: QwuestionBuilder!
    var resultAns = ""
    var rightAns = "Авспом"
    
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
        if segue.identifier == "fromFourToFiveQuestion" {
                    if let question5Controller = segue.destination as?  FiveQuestionViewController{
                        question5Controller.questionsContainer = self.questionsContainer
                    }
                }
    }

}
