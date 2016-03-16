//
//  FirstViewController.swift
//  To Do List
//
//  Created by Matthew Young on 11/16/15.
//  Copyright © 2015 Matthew Young. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDelegate {

    var arrayOfItems = NSUserDefaults.standardUserDefaults().objectForKey("toDoListArray") as? [String]
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    @IBAction func clearButton(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject([], forKey: "toDoListArray")
        arrayOfItems = NSUserDefaults.standardUserDefaults().objectForKey("toDoListArray") as? [String]
        toDoTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        toDoTableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        arrayOfItems = NSUserDefaults.standardUserDefaults().objectForKey("toDoListArray") as? [String]
        toDoTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrayOfItems == nil {
            NSUserDefaults.standardUserDefaults().setObject(["Test"], forKey: "toDoListArray")
            arrayOfItems = NSUserDefaults.standardUserDefaults().objectForKey("toDoListArray") as? [String]
        }
            return arrayOfItems!.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = arrayOfItems![indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            arrayOfItems = NSUserDefaults.standardUserDefaults().objectForKey("toDoListArray") as? [String]
            arrayOfItems?.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(arrayOfItems, forKey: "toDoListArray")
            toDoTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

