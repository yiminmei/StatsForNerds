//
//  AboutViewController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//


import UIKit

// the ommited code is meant for handling facebook login, but failed due to linker problem
//import FBSDKCoreKit
//import FBSDKLoginKit

// this class gives information about the developer
class AboutViewController: UIViewController{
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad(){
        super.viewDidLoad();
        textView.text = "Developer\nID:010882560 \nStudent: Yimin Mei \nFinal Project for CS175\nContact: yimin.mei@sjsu.edu\nInspired by Math 161A taught by Bryan Humphreys "
    /*
        let loginbutton = FBSDKLoginButton()
        loginbutton.readPermissions = [ "public_profile" , "email" , "user_friends"]
        loginbutton.center = self.view.center
        loginbutton.delegate = self
        self.view.addSubview(loginbutton)
         FBSDKLoginButtonDelegate
         */
    
    }
    
    /*
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {

        
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }*/
    
    
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning();
        
    }
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    
    
}
