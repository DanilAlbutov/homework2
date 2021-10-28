//
//  CatViewController.swift
//  homework2
//
//  Created by Данил Албутов on 27.10.2021.
//

import UIKit

class DogViewController: UIViewController {

    var questions: QwuestionBuilder = QwuestionBuilder()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromCatToQuestion" {
                    if let question1Controller = segue.destination as?  OneQuestionViewController{
                        question1Controller.questionsContainer = self.questions
                        question1Controller.isTestAboutDogs = true
                    }
                }
    }
    

}
