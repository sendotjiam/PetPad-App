//
//  UIViewController+Ext.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 21/10/21.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func createAlert(title : String?, message : String?, didReceiveError : Bool) -> UIAlertController {
        let actionTitle = didReceiveError ? "Try Again" : "Ok"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        return alert
    }
}
