//
//  RegisterViewController.swift
//  WatherApp
//
//  Created by Apple MacBook Pro on 3/4/20.
//  Copyright © 2020 Apple MacBook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class RegisterViewController: UIViewController {

    @IBOutlet weak var LogBtn: UIButton!
    
    @IBOutlet weak var FirstNameLbl: SkyFloatingLabelTextField!
    
    @IBOutlet weak var LastNameLbl: SkyFloatingLabelTextField!
    
    @IBOutlet weak var MobileLbl: SkyFloatingLabelTextField!
    
    @IBOutlet weak var EmailLbl: SkyFloatingLabelTextField!
    
    @IBOutlet weak var GenderLbl: SkyFloatingLabelTextField!
    
    @IBOutlet weak var DistrictLbl: SkyFloatingLabelTextField!
    @IBOutlet weak var LocationLbl: SkyFloatingLabelTextField!
    
    @IBOutlet weak var PasswordLbl: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegesterAction(_ sender: Any) {
        
        postdata()
        let vc = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
               self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func LogInAction(_ sender: Any) {
      let vc = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    func postdata(){
        let parameters = ["FirstName": FirstNameLbl.text,"LastName":LastNameLbl.text,"mobile":MobileLbl.text,"email":EmailLbl.text,"gender":GenderLbl.text,"district":DistrictLbl.text,"location":LocationLbl.text, "password": PasswordLbl.text] as [String : Any]
           //let parameters = ["mobile":"01742011644", "password": "123456"] as [String : Any]

           //create the url with URL
           let url = URL(string: "http://192.168.0.30/bdweather/API/registration.php")! //change the url

           //create the session object
           let session = URLSession.shared

           //now create the URLRequest object using the url object
           var request = URLRequest(url: url)
           request.httpMethod = "POST" //set http method as POST

           do {
               request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
           } catch let error {
               print(error.localizedDescription)
           }

           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.addValue("application/json", forHTTPHeaderField: "Accept")

           //create dataTask using the session object to send data to the server
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

               guard error == nil else {
                   return
               }

               guard let data = data else {
                   
                   return
               }

               do {
                   print(data)
                   //create json object from data
                   if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                       print(json)
                       // handle json...
                   }
               } catch let error {
                  
                   print(error.localizedDescription)
               }
           })
           task.resume()
       }
  
}
