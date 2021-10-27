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
        
        let views = stackViews[0].arrangedSubviews
        
        for v in views {
            if let imgView = v as? UIImageView {
                //imgView.image = questionsContainer.questionList[3].qestionImageView.image
            }
        }
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
            
        }
    }
    
    

}
