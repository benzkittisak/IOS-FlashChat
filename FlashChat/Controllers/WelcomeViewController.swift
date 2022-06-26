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
        
        
//        ติดตั้ง dependency เพิ่มชื่อ CLTypingLabell ผ่าน cocoapod เราก็ไม่ต้องมาทำอะไรแบบข้างบนอีก เรียกใช้แบบข้างล่างได้เลย
        titleLB.text = "⚡️FlashChat"
    }
    

}

