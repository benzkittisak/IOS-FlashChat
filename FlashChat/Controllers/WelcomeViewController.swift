//
//  ViewController.swift
//  FlashChat
//
//  Created by Kittisak Panluea on 26/6/2565 BE.
//

import UIKit

import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLB: CLTypingLabel!
    
//    เปิดแอปมาให้มันปิดตัว navigation bar ออกไปก่อน
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
//    พอเปิดเสร็จก้ให้มันยกเลิกการซ่อนเพราะว่าหน้าอื่นจะได้มี navbar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        มาทำแอนนิเมชันให้ตัว titleLabel กันให้มันพิมพ์ข้อความคำว่า FlashChat ออกมาทีละตัว
        
//        let titleText = "⚡️FlashChat"
//        var charIndex = 0.0
//        for letter in titleText {
//            ต้องคูณด้วย charIndex อะนะเพราะว่าไม่งั้นมันจะแสดงออกมาพร้อมกันเลยเพราะเวลาดีย์เลมันเท่ากันหมดทุกตัว
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex , repeats: false) { timer in
//                self.titleLB.text?.append(letter)
//            }
//            charIndex += 1
//        }
        
//        หรือจะติดตั้ง dependency เพิ่มชื่อ CLTypingLabel ผ่าน cocoapod เราก็ไม่ต้องมาทำอะไรแบบข้างบนอีก เรียกใช้แบบข้างล่างได้เลย
        titleLB.text = Const.appName
    }
    

}

