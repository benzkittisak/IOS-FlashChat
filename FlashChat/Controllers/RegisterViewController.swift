//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Kittisak Panluea on 26/6/2565 BE.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        guard let email = emailTF.text else { return print("Error email is nil") }
        guard let password = passwordTF.text else { return print("Error email is nil") }
        
        //        ให้มันสร้าง user กับ email เข้าไปเก็บที่ firestore
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            //            if error not nil
            if let err = error {
                //                เรียกใช้ Alert เหมือน alert() ใน js แหละ
                let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message: err.localizedDescription, preferredStyle: .alert)
                //                เพิ่มปุ่ม ตกลง ไปที่ alert แล้วก็ถ้ากดตกลงก็ให้ปิด alert
                alert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: nil))
                //                เอา popup ขึ้นไปแสดงผล
                self.present(alert, animated: true, completion: nil)
//                print(err.localizedDescription)
            } else {
                //            if register success
                //            Navigate to the ChatViewController
                self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
            }
        }
        
    }

}



