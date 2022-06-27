//
//  MessageCell.swift
//  FlashChat
//
//  Created by Kittisak Panluea on 26/6/2565 BE.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    
    @IBOutlet weak var lable: UILabel!
    
    @IBOutlet weak var rightIV: UIImageView!
    
//    เหมือนกับตัว didLoad แหละ มันจะถูกเรียกอัตโนมัติเมื่่อมีการเรียกใช้ MessageCell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        messageBubble.layer.cornerRadius = messageBubble.frame.height / 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
