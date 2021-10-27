//
//  ResultScreenViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class ResultScreenViewController: UIViewController {

   
    var questionsContainer: QwuestionBuilder!
    
    @IBOutlet var stackViews: [UIStackView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        fillData()
        //myImageView.image = questionsContainer.questionList[0].qestionImageView.image
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuButton(_ sender: Any) {
        print("0000")
        
        if let viewControllers = self.navigationController?.viewControllers{
            for vc in viewControllers{
                if vc is UITabBarController{
                    self.navigationController?.popToViewController(vc, animated: true)
                    print("1337")
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
                        labels[1].text = " Правильный ответ : \(questionsContainer.questionList[i].rightAnswer)"
                    }
                    
                }
            }
        }
    }
    
    

}
