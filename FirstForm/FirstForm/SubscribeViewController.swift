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
        self.title = NSLocalizedString("subscribe.title", comment: "")
        self.loginTextField.placeholder = NSLocalizedString("subscribe.form.login.placeholder", comment: "")
        self.passwordTextField.placeholder = NSLocalizedString("subscribe.form.password.placeholder", comment: "")
        self.subscribe_button.setTitle(NSLocalizedString("subscribe.form.subscribe.button", comment: ""), for : .normal)


        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func handleSubscribe(_ sender: Any) {
        guard let login = self.loginTextField.text,
              let password = self.passwordTextField.text else {
            self.displayErroMessage(title: NSLocalizedString("subscribe.form.alert.title", comment: ""), message: NSLocalizedString("subscribe.form.alert.invalid", comment: ""))
            return
        }
        guard login.count >= 4 else {
            self.displayErroMessage(title: NSLocalizedString("subscribe.form.alert.title", comment: ""), message: NSLocalizedString("subscribe.form.alert.invalid.login", comment: ""))
            return
        }
        guard password.count >= 6 else {
            self.displayErroMessage(title: NSLocalizedString("subscribe.form.alert.title", comment: ""), message: NSLocalizedString("subscribe.form.alert.invalid.password", comment: ""))
            return
        }
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
        alert.addAction(UIAlertAction(title: "Fermer", style: .cancel))
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
