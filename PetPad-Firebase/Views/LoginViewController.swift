//
//  LoginController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 19/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(true)
    //    }
    //
    //    @IBAction func signInBtnTapped(_ sender: Any) {
    //        guard
    //            let email = emailField.text,
    //            let password = passwordField.text
    //        else { return }
    //
    //        if validateData(email: email, password : password) {
    //            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
    //                if error != nil {
    //                    print("LOGIN NOT SUCCESS")
    //                    print(error?.localizedDescription)
    //                    return
    //                } else {
    //                    print("LOGIN SUCCESS")
    ////                    print(result!)
    //                }
    //            }
    //        }
    //    }
    //
    //    private func validateData(email: String, password : String) -> Bool {
    //        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    //        if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email){
    //            print("EMAIL ERROR")
    //            return false
    //        }
    //        if password.count < 8 || password.count > 20 {
    //            print("PASSWORD ERROR")
    //            return false
    //        }
    //        return true
    //    }
    
    @IBAction func loginTapped(_ sender: Any) {
        guard let tabBarController = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else {
            print("Something wrong in storyboard")
            return
        }
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.selectedIndex = 0
        self.present(tabBarController, animated: true, completion: nil)
    }
    @IBAction func goToSignUpTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goToSignUp", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.performSegue(withIdentifier: "goToSignUp", sender: nil)
    }
}
