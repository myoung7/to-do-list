//
//  SecondViewController.swift
//  To Do List
//
//  Created by Matthew Young on 11/16/15.
//  Copyright © 2015 Matthew Young. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addNewButton(sender: AnyObject) {
        var newArray: [String] = []
        if var currentItemArray = NSUserDefaults.standardUserDefaults().objectForKey("toDoListArray") as? [String]{
            newArray = currentItemArray
            if let newReminder = textField.text {
                newArray.append(newReminder)
                print(newArray)
                NSUserDefaults.standardUserDefaults().setObject(newArray, forKey: "toDoListArray")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

