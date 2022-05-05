//
//  SubscribeViewController.swift
//  FirstForm
//
//  Created by Etudiant on 03/05/2022.
//

import UIKit

class SubscribeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var subscribe_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Subscribe"
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func handleSubscribe(_ sender: Any) {
        guard let login = self.loginTextField.text,
              let password = self.passwordTextField.text else {
            self.displayErroMessage(title: "Invalid form", message: "Fields are mandatory")
            return
        }
        self.displayErroMessage(title: "Invalid form", message: "Fields are mandatory")
        print(login)
        print(password)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.loginTextField {
            self.passwordTextField.becomeFirstResponder()
        }
        if textField == self.passwordTextField {
            self.passwordTextField.resignFirstResponder() // Permet de fermer le clavier
            self.handleSubscribe(self.subscribe_button!)
        }
        return true
    }
    
    func displayErroMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert,animated: true) {
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {_ in alert.dismiss(animated: true)}
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
