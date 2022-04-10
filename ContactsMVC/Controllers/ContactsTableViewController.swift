//
//  ContactsTableViewController.swift
//  ContactsMVC
//
//  Created by luiza on 08/04/22.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    var contacts: [Contact] = [
    Contact(name: "Paul MacCartney", email: "paulm@gmail.com", phone: "+55 11 974932395"),
    Contact(name: "Calvin Klein", email: "calvink@gmail.com", phone: "+55 11 974930026"),
    Contact(name: "Rodolfo Valentino", email: "rodolfinho@gmail.com", phone: "+55 11 964258798")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        
        tableViewConfig()
        addContactButton()
    }
    
    func tableViewConfig() {
        tableView.register(
            UINib(
                nibName: "CustomTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: String(
                describing: CustomTableViewCell.self
            )
        )
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let contactInfoViewController = ContactInfoViewController(nibName: nil, bundle: nil)
        contactInfoViewController.info = contacts[indexPath.row]
        
        navigationController?.pushViewController(contactInfoViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellGeneric = tableView.dequeueReusableCell(withIdentifier: String(describing:CustomTableViewCell.self), for: indexPath)
        
        if let cell = cellGeneric as? CustomTableViewCell {
            cell.nameTitleLabel?.text = contacts[indexPath.row].name
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    @objc
    func addContactView(_ sender: UIButton) {
        let addContact = AddContactViewController(nibName: "AddContactViewController", bundle: nil)
        addContact.delegate = self
        
        navigationController?.pushViewController(addContact, animated: true)
    }
    
    private func addContactButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContactView))
        
        navigationItem.setRightBarButton(button, animated: true)
    }
}

extension ContactsTableViewController: AddContactViewControllerDelegate {
    func didSaveContact(_ contact: Contact) {
        DispatchQueue.main.async {
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
    }
}
