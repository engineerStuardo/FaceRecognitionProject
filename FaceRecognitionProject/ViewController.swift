//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Italo Stuardo on 2/4/23.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.messageLabel.text = ""
    }

    @IBAction func signIn(_ sender: Any) {
        let authContext = LAContext()
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                DispatchQueue.main.async {
                    if success == true {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                        self.messageLabel.text = ""
                    } else {
                        self.messageLabel.text = "Error with authentication!!"
                    }
                }
            }
        } else {
            self.messageLabel.text = "No biometric's detected"
        }
    }
    
}

