//
//  AddContactViewControllerDelegate.swift
//  ContactsMVC
//
//  Created by luiza on 10/04/22.
//

import Foundation

protocol AddContactViewControllerDelegate: AnyObject {
    func didSaveContact(_ contact: Contact)
}
