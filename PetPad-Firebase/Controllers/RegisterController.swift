//
//  RegisterController.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 07/01/22.
//

import Foundation
import UIKit
import FirebaseAuth

protocol RegisterControllerDelegate {
    func didValidateError(title: String, message: String)
    func didValidateSuccess()
}

struct RegisterController {
    
    var delegate : RegisterControllerDelegate?
    
    func validateData(_ email: String, _ password : String, _ username : String, _ confirmPassword : String) {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email){
            delegate?.didValidateError(title: "Error Email", message: "Please input correct email")
            return
        }
        if username.count < 3 || username.count > 10 {
            delegate?.didValidateError(title: "Username Error", message: "Username should be more than 2 and less than 10 characters.")
            return
        }
        if password.count < 8 || password.count > 20 {
            delegate?.didValidateError(title: "Password Error", message: "Password shoudl be more than 7 and less than 20 characters")
            return
        }
        if confirmPassword != password {
            delegate?.didValidateError(title: "Confirm Password Error", message: "Confirm password is not same as the password")
            return
        }
        delegate?.didValidateSuccess()
    }
    
    func registerUser(_ email: String, _ password : String, completion : ((AuthDataResult?, Error?) -> Void)?) {
        DispatchQueue.global().async {
            Auth.auth().createUser(withEmail: email, password: password, completion: completion)
        }
    }
    
    
    
}
