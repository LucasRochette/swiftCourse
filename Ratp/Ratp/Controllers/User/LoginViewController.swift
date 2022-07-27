
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func handleLogin(_ sender: Any) {
        
        guard let username = self.usernameTextField.text,
                     let password = self.passwordTextfield.text else {
                  return
               }
               guard username.count > 0 && password.count > 0 else {
                   return
               }
               LoginService.shared.AuthLogin(username: username, password: password, completion: { bool in
                   if bool == true {
                       DispatchQueue.main.async {
                           self.navigationController?.pushViewController(WeatherViewController(), animated: true)
                       }
                   } else {
                       return
                       }
               })
           }
}
    
    


