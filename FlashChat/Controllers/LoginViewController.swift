//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Kittisak Panluea on 26/6/2565 BE.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        guard let email = emailTF.text else { return print("Error email is nil or empty") }
        guard let password = passwordTF.text else { return print("Error password is nil or empty") }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let err = error {
                let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message: err.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                self.performSegue(withIdentifier: Const.loginSegue , sender: self)
            }
        }
    }
    
}
