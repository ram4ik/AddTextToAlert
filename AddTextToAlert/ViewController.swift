//
//  ViewController.swift
//  AddTextToAlert
//
//  Created by Ramill Ibragimov on 28.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Show Alert", for: .normal)
        button.center = view.center
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    @objc private func showAlert() {
        let alert = UIAlertController(title: "Sign In with Apple ID", message: "Please sign in to your account to continue.", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Email Adress"
            field.returnKeyType = .next
            field.keyboardType = .emailAddress
        }
        alert.addTextField { field in
            field.placeholder = "Password"
            field.returnKeyType = .continue
            field.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            guard let fields = alert.textFields, fields.count == 2 else { return }
            let emailField = fields[0]
            let passwordField = fields[1]
            guard let email = emailField.text, !email.isEmpty,
                  let password = passwordField.text, !password.isEmpty else {
                print("Invalid entries")
                return
            }
            print("Email is \(email) & password is \(password)")
        }))
        present(alert, animated: true)
    }
}

