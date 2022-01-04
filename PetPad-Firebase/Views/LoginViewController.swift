//
//  LoginController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 19/10/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    private func validateData(_ email: String, _ password : String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email){
            print("EMAIL ERROR")
            return false
        }
        if password.count < 8 || password.count > 20 {
            print("PASSWORD ERROR")
            return false
        }
        return true
    }
    
    private func handleLogin() {
        guard
            let email = emailField.text,
            let password = passwordField.text
        else { return }
        if validateData(email, password) {
            DispatchQueue.global().async {
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    guard error == nil else { return }
                    DispatchQueue.main.async { self.presentHomeVC() }
                }
            }
        }
    }
    
    private func presentHomeVC() {
        guard let tabBarController = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else { return }
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.selectedIndex = 0
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        print("MASUK")
        handleLogin()
    }
    @IBAction func presentSignUpTapped(_ sender: Any) {
        self.present(RegisterViewController(), animated: true, completion: nil)
    }
}
