//
//  FiveQuestionViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class FiveQuestionViewController: UIViewController {

    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet var answerButtonList: [UIButton]!
    var questionsContainer: QwuestionBuilder!
    var resultAns = ""
    var rightAns = "Сенбердель"
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
            rightAns = "Гарри Поттер и тайная ĸомната"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromFiveToResultScreen" {
                    if let resultScreenController = segue.destination as?  ResultScreenViewController{
                        resultScreenController.questionsContainer = self.questionsContainer
                    }
                }
    }
    
}
