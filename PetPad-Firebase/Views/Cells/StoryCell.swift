//
//  StoryCell.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 06/12/21.
//

import UIKit

class StoryCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
