//
//  AddContactViewController.swift
//  ContactsMVC
//
//  Created by luiza on 10/04/22.
//

import UIKit

class AddContactViewController: UIViewController {
    
    weak var delegate: AddContactViewControllerDelegate?
    var barButtonItem: UIBarButtonItem?
    
    @IBOutlet weak var newNameLabel: UILabel!
    @IBOutlet weak var newEmailLabel: UILabel!
    @IBOutlet weak var newPhoneLabel: UILabel!
    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPhoneTextField: UITextField!
    
    @objc
    func doneButtonAction(_sender: UIBarButtonItem) {
        var flagEmpty = false
        if let text = newNameTextField.text, text.isEmpty {
            let alertController = UIAlertController(title: "Houve um erro", message: "Preencha todos os campos corretamente.", preferredStyle: .alert)
            newNameTextField.backgroundColor = UIColor.init(red: 234.0/255.0, green: 153.0/255.0, blue: 213.0/255.0, alpha: 1.0)
            flagEmpty = true
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.newNameTextField.backgroundColor = UIColor.clear
                print("OK Action clicked.")
            }
            
            alertController.addAction(okAction)
            present(alertController, animated: true) {
                print("Completion was called.")
            }
        }
        
        if let text = newEmailTextField.text, text.isEmpty {
            let alertController = UIAlertController(title: "Houve um erro", message: "Preencha os campos corretamente", preferredStyle: .alert)
            newEmailTextField.backgroundColor = UIColor.init(red: 234.0/255.0, green: 153.0/255.0, blue: 213.0/255.0, alpha: 1.0)
            flagEmpty = true
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.newEmailTextField.backgroundColor = UIColor.clear
                print("OK Action was called.")
            }
            
            alertController.addAction(okAction)
            present(alertController, animated: true) {
                print("Completion was called.")
            }
        }
        
        if let text = newPhoneTextField.text, text.isEmpty {
            let alertController = UIAlertController(title: "Houve um erro", message: "Preencha os campos corretamente", preferredStyle: .alert)
            newPhoneTextField.backgroundColor = UIColor.init(red: 234.0/255.0, green: 153.0/255.0, blue: 213.0/255.0, alpha: 1.0)
            flagEmpty = true
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.newPhoneTextField.backgroundColor = UIColor.clear
                print("OK Action was called.")
            }
            
            alertController.addAction(okAction)
            present(alertController, animated: true) {
                print("Completion was called.")
            }
        }
        
        if let name = newNameTextField.text, let email = newEmailTextField.text, let phone = newPhoneTextField.text, !flagEmpty {
            delegate?.didSaveContact(Contact(name: name, email: email, phone: phone))
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func addBarButton() {
        barButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        barButtonItem?.isEnabled = false
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButton()
        addDelegates()
        nameLabels()
        
    }
    
    private func nameLabels() {
        newNameLabel.text = "New name:"
        newEmailLabel.text = "New email:"
        newPhoneLabel.text = "New phone:"
        
        newNameTextField.placeholder = "Name"
        newEmailTextField.placeholder = "Email"
        newPhoneTextField.placeholder = "Phone"
    }
    
    private func addDelegates() {
        newNameTextField.delegate = self
        newEmailTextField.delegate = self
        newPhoneTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension AddContactViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = newNameTextField.text, let email = newEmailTextField.text, let phone = newPhoneTextField.text, !name.isEmpty, !email.isEmpty, !phone.isEmpty {
            barButtonItem?.isEnabled = true
        }
    }
}
