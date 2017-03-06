//
//  ViewController.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/5/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabel.text = textField.text
    }
    //MARK: Actions
    @IBAction func addButton(_ sender: UIButton) {
        nameLabel.text = "Default Text"
    }
    
  }

