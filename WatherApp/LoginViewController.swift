//
//  LoginViewController.swift
//  WatherApp
//
//  Created by Apple MacBook Pro on 3/4/20.
//  Copyright © 2020 Apple MacBook Pro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func RegAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "RegisterViewController") as! RegisterViewController
        self.present(vc, animated: true, completion: nil)
    }
    

}
