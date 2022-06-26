//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Kittisak Panluea on 26/6/2565 BE.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        title = ชื่อของหน้านี้ที่มันอยู่บนแถบ nav นั่นแหละที่มันอยู่ตรงกลางน่ะ ลองรันดูละกัน
        title = Const.appName
        
        
        //        ก็คือให้มันซ่อนปุ่ม กลับ นั่นแหละเพราะว่าถ้าล็อคอินเข้ามาแล้วมันก็ไม่ควรที่จะกลับไปหน้า login ได้แล้ว
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            //            คือ view มันทับซ้อน ๆ กันยุอะนะถ้ากลับไปทีละตัวมันจะลำบาก ดังนั้นก็จะใช้ method นี้เพื่ือให้มันกลับไปหน้าแรกเลย
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}
