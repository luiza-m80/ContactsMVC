//
//  ContactInfoViewController.swift
//  ContactsMVC
//
//  Created by luiza on 09/04/22.
//

import UIKit

class ContactInfoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameContentLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailContentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneContentLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var info: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Informações do Contato"
        
        attributeLabelToText()
        labelNames()
    }
    
    private func attributeLabelToText() {
        nameContentLabel.text = info?.name
        emailContentLabel.text = info?.email
        phoneContentLabel.text = info?.phone
    }
    
    private func labelNames() {
        nameLabel.text = "Name:"
        emailLabel.text = "Email: "
        phoneLabel.text = "Phone:"
    }
}
