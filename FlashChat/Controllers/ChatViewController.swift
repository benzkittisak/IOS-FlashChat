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
    
    var messages:[Message] = []
    
    //    เรียกใช้งาน Firestore
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        title = ชื่อของหน้านี้ที่มันอยู่บนแถบ nav นั่นแหละที่มันอยู่ตรงกลางน่ะ ลองรันดูละกัน
        title = Const.appName
        
        //        ก็คือให้มันซ่อนปุ่ม กลับ นั่นแหละเพราะว่าถ้าล็อคอินเข้ามาแล้วมันก็ไม่ควรที่จะกลับไปหน้า login ได้แล้ว
        navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        
        //        ใช้ตัว cell ที่เราสร้างขึ้นมาเอง
        tableView.register(UINib.init(nibName: Const.cellNibName, bundle: nil), forCellReuseIdentifier: Const.cellIdentifier)
        
//        เมื่อหน้าแชทโหลดขึ้นมาเราก็จะให้มันเรียกใช้ฟังก์ชันนี้เพื่อไปดึงข้อมูลแชทจาก firebase มา
        loadMessage()
    }
    
    
    func loadMessage() {
        messages = []
        
//        อ่านข้อมูลจาก firestore
        db.collection(Const.FStore.collectionName).getDocuments { querySnapshot, error in
            if let err = error {
                print("There was an issue retrieving messsage from firestore , \(err)")
            } else {
//                querySnapshot มันเป็น array แหละมั่ง ลืมแฮะ
                for document in querySnapshot!.documents {
                    let data = document.data()
                    
                    guard let messageSender = data[Const.FStore.senderField] as? String else {
                        return print("Error the sender from firestore is empty or nil") }
                    
                    guard let messageBody = data[Const.FStore.bodyField] as? String else { return print("Error the message body from firestore is nil") }
                    
                    let newMessage = Message(sender: messageSender, body: messageBody)
                    self.messages.append(newMessage)
                }
            }
        }
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let messageBody = messageTF.text else { return print("Error message body is empty or nil") }
        
        //        แล้วเราจะไปเอา ข้อมูลผู้ส่งมาจากไหน เราก็จะไปเอามาจาก firebase แบบนิ้
        //        เอา email ของคนที่กำลัง login เข้ามาอยู่
        guard let messageSender = Auth.auth().currentUser?.email else { return print("Error sender is empty or nil") }
        

        var ref:DocumentReference? = nil
        //        ต่อไปจะทำการเลือก collection มาใช้แหละ ซึ่งเราจะใช้ชื่อ collection ว่า message
        ref = db.collection(Const.FStore.collectionName).addDocument(data: [
            Const.FStore.senderField:messageSender,
            Const.FStore.bodyField:messageBody
        ], completion: { error in
            if let err = error {
                print("There was an issue saving data to firestore . \(err)")
            } else {
                print("Successfully added data")
            }
        })
        
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

// เราจะเอาข้อมูลไปแสดงผลในตารางแหละ
extension ChatViewController : UITableViewDataSource {
    
    //    จำนวนแถวในตารางแหละ
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        สร้าง cell 1 cell น่ะ
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellIdentifier, for: indexPath) as! MessageCell
        cell.lable.text = "\(messages[indexPath.row].body)"
        return cell
    }
}
