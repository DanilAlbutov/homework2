//
//  OneQuestionViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class OneQuestionViewController: UIViewController {
    
    @IBOutlet private weak var buttonNext: UIButton!
    @IBOutlet private weak var questionImage: UIImageView!
    @IBOutlet private var answerButtonList: [UIButton]!
    var questionsContainer: QwuestionBuilder!
    var resultAns = ""
    var rightAns = "Джеĸ-а-Пу"
    var isTestAboutDogs = true
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTest()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        // Do any additional setup after loading the view.
    }
        
    @IBAction func onButtonClick(_ sender: UIButton) {
        
        if sender == buttonNext {
            saveQuestion(queCont: questionsContainer, rightAnswer: rightAns, resultAnswer: resultAns, btnArr: answerButtonList, img: questionImage)
        } else {
            resultAns = changeButtonState(btnArr: answerButtonList, button: sender)
        }
        
    }
    
    func saveQuestion(queCont: QwuestionBuilder,
                      rightAnswer: String,
                      resultAnswer: String,
                      btnArr: [UIButton],
                      img: UIImageView){
        var answerList: [String] = []
        for item in btnArr {
            answerList.append((item.titleLabel?.text)!)
        }
        queCont.saveNewQuestion(qestionImageView: img, resultAnswer: resultAnswer, rightAnswer: rightAnswer, answerOptions: answerList)
    }
    
    func changeButtonState(btnArr: [UIButton], button: UIButton) -> String{
        var res = ""
        for i in btnArr.indices {
            if btnArr[i] == button {
                btnArr[i].isEnabled = false
                res = (button.titleLabel?.text)!
            } else{
                btnArr[i].isEnabled = true
            }
        }
        return res
    }
    
    func checkTest(){
        if (!isTestAboutDogs) {
            rightAns = "Чужой"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromOneQwestionToSecond" {
                    if let question2Controller = segue.destination as?  TwoQuestionViewController{
                        question2Controller.questionsContainer = self.questionsContainer
                        question2Controller.isTestAboutDogs = self.isTestAboutDogs
                    }
                }
    }
    

    
}
