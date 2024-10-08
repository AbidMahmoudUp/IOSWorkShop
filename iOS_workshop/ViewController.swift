//
//  ViewController.swift
//  iOS_workshop
//
//  Created by wicked on 29.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var usernameExmpleToBeSendToMyWebService :String = "Test"
    var passwordExmpleToBeSendToMyWebServce  : String = "Test"
    
    
    @IBOutlet weak var UsernameTextFiled: UITextField!
    

    @IBOutlet weak var PasswordTextFiled: UITextField!
    
    
    
    @IBAction func LoginButton(_ sender: Any) {
        var username:String = UsernameTextFiled.text!
        var password:String = PasswordTextFiled.text!
        if((UsernameTextFiled.text?.isEmpty == true) )
        {
            let alert = UIAlertController(title: "Failed!", message: "Can You Please Entre Your Credentiels.", preferredStyle: .alert)
            
                   alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert,animated: true)
        }
        if(PasswordTextFiled.text?.isEmpty == true)
        {
            let alert = UIAlertController(title: "Failed!", message: "Can You Please Entre Your Credentiels.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert,animated: true)
            
            
        }
        if((PasswordTextFiled.text! == passwordExmpleToBeSendToMyWebServce) && (UsernameTextFiled.text! == usernameExmpleToBeSendToMyWebService))
        {
            performSegue(withIdentifier: "ShowHomePage", sender: self)
            print(username)
            print(password)
        }



    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHomePage"{
            if let destinationVC = segue.destination as? HomePageViewController {
                destinationVC.data = usernameExmpleToBeSendToMyWebService
            }       }
    }
    
    
    
    
    
}

