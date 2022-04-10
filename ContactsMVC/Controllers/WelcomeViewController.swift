//
//  WelcomeViewController.swift
//  ContactsMVC
//
//  Created by luiza on 10/04/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    private func didSaveFlag() {
        let userDefaults = UserDefaults.standard
        let key = "WelcomeViewControllerKey"
        userDefaults.set(true, forKey: key)
    }
    
    @IBAction func didTouchAtOkButton(_ sender: Any) {
        let contactsTableViewController = ContactsTableViewController()
        contactsTableViewController.modalPresentationStyle = .fullScreen
        
        present(contactsTableViewController, animated: true) {
            self.didSaveFlag()
        }
    }
    
    

}
