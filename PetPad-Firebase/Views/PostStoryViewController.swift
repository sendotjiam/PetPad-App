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
    
    private let postStoryController = PostStoryController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func postBtnTapped(_ sender: Any) {
        // Validating the data
        if validateField() {
            // Create the data and post to firestore
            let isSuccessCreateNewStory = postStoryController.createNewStory(documentData: [
                "title": titleField.text!,
                "story": storyField.text!,
                "is_anonym": isAnonymSenderSwitch.isOn
            ]);
            
            if isSuccessCreateNewStory {
                self.dismiss(animated: true, completion: nil)
            } else {
                showAlert(title: "Error Submitting Data", message: "Please try again", style: .cancel)
            }
        }
    }
    
    private func setupUI() {
        titleField.addBorder(width: 1, color: UIColor.systemGray)
        storyField.addBorder(width: 1, color: UIColor.systemGray)
        titleField.addRoundedCorner(radius: 4)
        storyField.addRoundedCorner(radius: 6)
        postBtn.addRoundedCorner(radius: 4)
    }
    
    private func validateField() -> Bool {
        let titleLen = titleField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count
        let storyLen = storyField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count
        guard titleLen >= 6,
              storyLen >= 10
        else {
            if titleLen < 6 {
                showAlert(title: "Alert", message: "Title length should be more than or equal 6 characters", style: .cancel)
            } else if storyLen < 10 {
                showAlert(title: "Alert", message: "Story length should be more than or equal 10 characters", style: .cancel)
            }
            return false
        }
        return true
    }
    
    private func showAlert(title : String, message : String, style: UIAlertAction.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
