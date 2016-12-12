//
//  NewDefinitionViewController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/9/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//
protocol NewDefinitionDelegate{
    func addNewDefinition( word: Word);
    
}
//This class handles adding new definitions
import UIKit
class NewDefinitionViewController: UIViewController {
    
    
    var delegate : NewDefinitionDelegate! = nil
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var definition: UITextView!
    
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
    
    // handles the done button, checks to see if user has strange inputs
    @IBAction func done(){
        let e : Word
        let empty1 =  self.name.text!.isEmpty
        let empty2 = self.definition.text!.isEmpty
        if( empty1 && empty2 ){
            e = Word( "Nameless Word" , "Undefined ")
        }else if (empty1){
            e = Word ("Nameless Word" , self.definition.text!);
        }else if(empty2){
            e = Word( self.name.text!, "Undefined");
        }else{
            e = Word(  self.name.text!   , self.definition.text!);
        }
        // use delegate to call back
        delegate.addNewDefinition(word: e);
        
        
    }
    
    
}
