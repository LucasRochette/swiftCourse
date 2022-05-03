//
//  SecondViewController.swift
//  Navapp
//
//  Created by Etudiant on 03/05/2022.
//

import UIKit

class SecondViewController: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second"
        // Do any additional setup after loading the view.
    //    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "BACJ", style: .plain, target: self, action: #selector(text))
    }


    @IBAction func backToFirst(_ sender: Any) {
        //let first = FirstViewController()
        self.navigationController?.popViewController(animated: true)

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
