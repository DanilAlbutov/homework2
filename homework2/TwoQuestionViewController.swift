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
    var isTestAboutDogs = true
    
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet var answerButtonList: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTest()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        let OneControllerObject = OneQuestionViewController()
        if sender == buttonNext {
            OneControllerObject.saveQuestion(queCont: questionsContainer, rightAnswer: rightAns, resultAnswer: resultAns, btnArr: answerButtonList, img: questionImage)
        } else {
            
            resultAns = OneControllerObject.changeButtonState(btnArr: answerButtonList, button: sender)
        }
        
    }
    
    func checkTest(){
        if (!isTestAboutDogs) {
            rightAns = "Мастер и Маргарита"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromTwoToThreeQuestion" {
                    if let question3Controller = segue.destination as?  ThreeQuestionViewController{
                        question3Controller.questionsContainer = self.questionsContainer
                        question3Controller.isTestAboutDogs = self.isTestAboutDogs
                    }
                }
    }

}
