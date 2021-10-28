//
//  CatViewController.swift
//  homework2
//
//  Created by Данил Албутов on 28.10.2021.
//

import UIKit

class CatViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromDogToQuestion" {
                    if let question1Controller = segue.destination as?  OneQuestionViewController{
                        let questions: QwuestionBuilder = QwuestionBuilder()
                        question1Controller.questionsContainer = questions
                        question1Controller.isTestAboutDogs = false
                    }
                }
    }
    

}
