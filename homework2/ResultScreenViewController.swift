//
//  ResultScreenViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class ResultScreenViewController: UIViewController {

   
    var questionsContainer: QwuestionBuilder!
    var mark = 0
    @IBOutlet private var stackViews: [UIStackView]!
    @IBOutlet private weak var markLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        fillData()
        
    }
    
    @IBAction func menuButton(_ sender: Any) {
        if let viewControllers = self.navigationController?.viewControllers{
            for vc in viewControllers{
                if vc is UITabBarController{
                    self.navigationController?.popToViewController(vc, animated: true)
                    
                }
            }
        }
    }
    
    func fillData(){
        for i in stackViews.indices{
            let views = stackViews[i].arrangedSubviews
            
            for v in views {
                if let imgView = v as? UIImageView {
                    imgView.image = questionsContainer.questionList[i].qestionImageView.image
                }
                if let stackView = v as? UIStackView {
                    if let labels = stackView.arrangedSubviews as? [UILabel] {
                        labels[0].text = " Ваш ответ: \(questionsContainer.questionList[i].resultAnswer)"
                        labels[1].text = " Правильный \n ответ : \(questionsContainer.questionList[i].rightAnswer)"
                        if checkAnswers(str1: questionsContainer.questionList[i].resultAnswer, str2: questionsContainer.questionList[i].rightAnswer) {
                            labels[0].textColor = .green
                        }
                        else {
                            labels[0].textColor = .red
                        }
                        labels[1].textColor = .green
                    }
                    
                }
            }
        }
        rate()
    }
    
    func checkAnswers(str1: String, str2: String) -> Bool{
        if str1 == str2 {
            mark += 1
            return true
        } else {
            return false
        }
    }
    
    func rate() {
        switch mark {
        case 0...1:
            markLabel.textColor = .red
        case 2...4:
            markLabel.textColor = .yellow
        case 5:
            markLabel.textColor = .green
        default:
            break
        }
        markLabel.text =  "\(mark)/5"
    }
    
    

}
