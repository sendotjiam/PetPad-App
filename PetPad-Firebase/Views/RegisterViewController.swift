//
//  RegisterController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 19/10/21.
//

import UIKit
//import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func signUpBtnTapped(_ sender: Any) {
//        guard
//            let email = emailField.text,
//            let password = passwordField.text,
//            let username = usernameField.text,
//            let confirmPassword = confirmPasswordField.text
//        else { return }
//        if validateData(email : email, password: password, username: username, confirmPassword: confirmPassword) {
//            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//                if error != nil {
//                    print(error?.localizedDescription)
//                }
//                else {
//                    self.dismiss(animated: true, completion: nil)
//                }
//            }
//        }
//    }
    
//    private func validateData(email: String, password : String, username : String, confirmPassword : String) -> Bool {
//        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
//        if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email){
//            print("EMAIL ERROR")
//            return false
//        }
//        if username.count < 3 || username.count > 10 {
//            print("USERNAME ERROR")
//            return false
//        }
//        if password.count < 8 || password.count > 20 {
//            print("PASSWORD ERROR")
//            return false
//        }
//        if confirmPassword != password {
//            print("CONFIRM PASSWORD ERROR")
//            return false
//        }
//        return true
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

