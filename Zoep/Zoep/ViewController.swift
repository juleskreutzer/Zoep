//
//  ViewController.swift
//  Zoep
//
//  Created by Jules Kreutzer on 07-07-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nameArray = [""];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "newName") {
            var svc = segue.destinationViewController as! secondViewController;
            
            var test = svc.toPass;
            NSLog(test);
            
        }
    }
    

    @IBAction func showInfor(sender: AnyObject) {
        var alert = UIAlertController(title: "Zeer uitgebreide handleiding", message: "Ohh.. I need to be replaced!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Begrepen", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

