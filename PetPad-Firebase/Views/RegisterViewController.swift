//
//  RegisterController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 19/10/21.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    
    var registerController = RegisterController()
    var validationSuccess = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        registerController.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        guard
            let email = emailField.text,
            let password = passwordField.text,
            let username = usernameField.text,
            let confirmPassword = confirmPasswordField.text
        else { return }
        
        registerController.validateData(email, password, username, confirmPassword)
        
        if validationSuccess {
            registerController.registerUser(email, password) { result, error in
                if error != nil {
                    let alert = self.createAlert(title: "Please try again later",
                                                 message: "Error occured while registering new user data.",
                                                 didReceiveError: true)
                    self.present(alert, animated: true, completion: nil)
                    return
                } else { DispatchQueue.main.async { self.presentHomeVC() } }
            }
        }
    }
    
    private func presentHomeVC() {
        guard let tabBarController = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else { return }
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.selectedIndex = 0
        self.present(tabBarController, animated: true, completion: nil)
    }
}

extension RegisterViewController : RegisterControllerDelegate {
    func didValidateError(title : String, message: String) {
        let alert = createAlert(title: title, message: message, didReceiveError: true)
        self.present(alert, animated: true, completion: nil)
    }
    
    func didValidateSuccess() {
        self.validationSuccess = true
    }
}
