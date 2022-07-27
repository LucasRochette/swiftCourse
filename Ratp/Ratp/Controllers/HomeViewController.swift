
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleLogin(_ sender: Any) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @IBAction func handleSignUp(_ sender: Any) {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
  
}
