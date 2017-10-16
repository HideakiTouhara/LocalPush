//
//  ViewController.swift
//  LocalPush_Learn
//
//  Created by HideakiTouhara on 2017/10/15.
//  Copyright © 2017年 HideakiTouhara. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var whoTextField: UITextField!
    @IBOutlet weak var honbunTextField: UITextField!
    
    var resultText = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        whoTextField.delegate = self
        honbunTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resultText = whoTextField.text! + ":" + honbunTextField.text!
        
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - アプリケーションロジック
    func startPush() {
        let content = UNMutableNotificationContent()
        content.body = resultText
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4.0, repeats: false)
        
        let requestIdentifier = "LinePush"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            
        })
        
    }

    // MARK: - IBAction
    @IBAction func buttonTapped(_ sender: UIButton) {
        startPush()
    }

}

