//
//  StoryCell.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 06/12/21.
//

import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupContent(title: String, story: String, sender: String) {
        titleLabel.text = title
        storyLabel.text = story
        senderLabel.text = sender
    }
    
}
