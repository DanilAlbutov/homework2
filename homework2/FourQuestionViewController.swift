//
//  FourQuestionViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class FourQuestionViewController: UIViewController {

    @IBOutlet private weak var buttonNext: UIButton!
    @IBOutlet private weak var questionImage: UIImageView!
    @IBOutlet private var answerButtonList: [UIButton]!
    var questionsContainer: QwuestionBuilder!
    var resultAns = ""
    var rightAns = "Авспом"
    var isTestAboutDogs = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        checkTest()
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
    
    func checkTest(){
        if (!isTestAboutDogs) {
            rightAns = "Стюарт Литтл"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromFourToFiveQuestion" {
                    if let question5Controller = segue.destination as?  FiveQuestionViewController{
                        question5Controller.questionsContainer = self.questionsContainer
                        question5Controller.isTestAboutDogs = self.isTestAboutDogs
                    }
                }
    }

}
