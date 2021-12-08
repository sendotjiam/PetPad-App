//
//  PostStoryViewController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 08/12/21.
//

import UIKit

class PostStoryViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var storyField: UITextView!
    @IBOutlet weak var isAnonymSenderSwitch: UISwitch!
    @IBOutlet weak var postBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func postBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
        titleField.addBorder(width: 1, color: UIColor.systemGray)
        storyField.addBorder(width: 1, color: UIColor.systemGray)
        titleField.addRoundedCorner(radius: 4)
        storyField.addRoundedCorner(radius: 6)
        postBtn.addRoundedCorner(radius: 4)
    }
}
