//
//  OneQuestionViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class OneQuestionViewController: UIViewController {
    
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet var answerButtonList: [UIButton]!
    var questionsContainer: QwuestionBuilder!
    var resultAns = ""
    var rightAns = "Джеĸ-а-Пу"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        
        if sender == buttonNext {
            saveQuestion(rightAnswer: rightAns, resultAnswer: resultAns, btnArr: answerButtonList, img: questionImage)
        } else {
            changeButtonState(btnArr: answerButtonList, button: sender)
        }
        
    }
    
    func saveQuestion(rightAnswer: String, resultAnswer: String, btnArr: [UIButton], img: UIImageView){
        var answerList: [String] = []
        for item in answerButtonList {
            answerList.append((item.titleLabel?.text)!)
        }
        questionsContainer.saveNewQuestion(qestionImageView: questionImage, resultAnswer: resultAnswer, rightAnswer: rightAnswer, answerOptions: answerList)
    }
    
    func changeButtonState(btnArr: [UIButton], button: UIButton){
        for i in btnArr.indices {
            if btnArr[i] == button {
                btnArr[i].isEnabled = false
                resultAns = (button.titleLabel?.text)!
            } else{
                btnArr[i].isEnabled = true
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromOneQwestionToSecond" {
                    if let question2Controller = segue.destination as?  TwoQuestionViewController{
                        question2Controller.questionsContainer = self.questionsContainer
                        
                    }
                }
    }
    

    
}
