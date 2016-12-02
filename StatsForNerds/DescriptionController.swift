//
//  DescriptionController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//


import UIKit

class DescriptionController: UIViewController {

    @IBOutlet weak var descript: UITextView!
    @IBOutlet weak var name: UITextView!
    var question : Question! = nil
    
    override func viewDidLoad() {
        
    
        super.viewDidLoad()
         //Do any additional setup after loading the view, typically from a nib.
         name.text = question.name
         descript.text = question.description
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    
    
}

