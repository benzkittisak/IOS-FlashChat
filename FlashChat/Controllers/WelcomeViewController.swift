//
//  ViewController.swift
//  FlashChat
//
//  Created by Kittisak Panluea on 26/6/2565 BE.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLB: UILabel!
    

     
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        มาทำแอนนิเมชันให้ตัว titleLabel กันให้มันพิมพ์ข้อความคำว่า FlashChat ออกมาทีละตัว
        titleLB.text = ""
        let titleText = "⚡️FlashChat"
        var charIndex = 0.0
        for letter in titleText {
//            ต้องคูณด้วย charIndex อะนะเพราะว่าไม่งั้นมันจะแสดงออกมาพร้อมกันเลยเพราะเวลาดีย์เลมันเท่ากันหมดทุกตัว
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex , repeats: false) { timer in
                self.titleLB.text?.append(letter)
            }
            charIndex += 1
        }
    }
    

}

