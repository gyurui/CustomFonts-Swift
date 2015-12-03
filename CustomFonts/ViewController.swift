//
//  ViewController.swift
//  CustomFonts
//
//  Created by Trum Gyorgy on 12/1/15.
//  Copyright (c) 2015 General Electric. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customFontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.customFontLabel.text = "Hello World"
    }
    
    @IBAction func pushNewFontButton(sender: AnyObject) {
            if var URL = NSURL(string: "http://www.webpagepublicity.com/free-fonts/e/Earthquake%20MF.ttf") {
                Downloader.load(URL)
            }
    }
    
    @IBAction func pushAndSetTheNewFont(sender: AnyObject) {
        
        self.customFontLabel.font = UIFont(name: "Earthquake MF", size: 20.0)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

