//
//  NegativeController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/2/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//

import UIKit

class NegativeController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    
    
}
