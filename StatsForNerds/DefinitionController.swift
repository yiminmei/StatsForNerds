//
//  DefinitionController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//


import UIKit

class DefinitionController: UIViewController {
    
    @IBOutlet weak var meaning: UITextView!
    @IBOutlet weak var name: UITextView!
    var word : Word! = nil
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib.
        name.text = word.name
        meaning.text = word.meaning
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    
    
}

