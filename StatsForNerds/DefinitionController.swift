//
//  DefinitionController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//


import UIKit

protocol ChangeDefinitionDelegate{
    func changeDefinition(word:Word);
}
// handles word display and change
class DefinitionController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var meaning: UITextView!
    
    var delegate : ChangeDefinitionDelegate! = nil
    
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
    // checks to see if user inputs something strange
    @IBAction func close(){
        
        let e : Word
        let empty1 =  self.name.text!.isEmpty
        let empty2 = self.meaning.text!.isEmpty
        
        if( empty1 && empty2 ){
            e = Word( "Nameless Word" , "Undefined ")
            
        }else if (empty1){
            e = Word ("Nameless Word" , self.meaning.text!);
            
        }else if(empty2){
            e = Word( self.name.text!, "Undefined");
        }else{
            e = Word(  self.name.text!   , self.meaning.text!);
        }
        // uses delegate to call back
        delegate.changeDefinition(word: e);
        
    }

    
    
}

