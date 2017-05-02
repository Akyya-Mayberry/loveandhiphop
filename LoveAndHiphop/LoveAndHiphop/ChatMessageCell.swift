//
//  ChatMessageCell.swift
//  LoveAndHiphop
//
//  Created by hollywoodno on 5/2/17.
//  Copyright © 2017 Mogulla, Naveen. All rights reserved.
//

import UIKit
import Parse

class ChatMessageCell: UITableViewCell {
  
  // MARK: Properties
  @IBOutlet weak var chatMessageText: UILabel!
  var message: PFObject! {
    didSet {
      chatMessageText.text = message["text"] as? String
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    chatMessageText.sizeToFit()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
