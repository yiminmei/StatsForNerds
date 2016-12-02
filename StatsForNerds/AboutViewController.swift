//
//  AboutViewController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//
import UIKit

class AboutViewController: UIViewController{
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad(){
        super.viewDidLoad();
        textView.text = "Developer\nID:010882560 \nStudent: Yimin Mei \nFinal Project for CS175\nContact: yimin.mei@sjsu.edu\nInspired by Math 161A taught by Bryan Humphreys "
        
        
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning();
        
    }
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    
}
