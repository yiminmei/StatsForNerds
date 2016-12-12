//
//  BinomialViewcontroller.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/2/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//

//
//  BinomialViewController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//


import UIKit
import Darwin

class BinomialViewController: UIViewController {
    @IBOutlet weak var kfield: UITextField!
    @IBOutlet weak var nfield: UITextField!
    @IBOutlet weak var pfield: UITextField!
    @IBOutlet weak var answerfield: UITextField!
    
    
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
    @IBAction func onClick() throws{
        //Needs some more work here!
        
        
        let k : Int? = Int(self.kfield.text!)
        let n : Int? =  Int(self.nfield.text!)
        let p : Double? =  Double(self.pfield.text!)
        
        
        var decoy:Double = Double( k! - 1)
        var pk : Double = p!
        print( "decoy is debug \(decoy)")
        while(decoy>0){
            print( "done it debug ")
            pk *= p!
            decoy-=1
        }
        print("pk is debug \(pk)")
        
        var oneminusp:Double = 1-p!
        var decoy2 = n! - k! - 1
        print( "decoy 2 is debug \(decoy2)")
        while( decoy2 > 0){
            oneminusp *= 1-p!
            decoy2-=1
        }
        
        print("oneminusp is debug \(oneminusp)")
        
        var answer: Double = Double(self.combinations(n!, choose: k!))
        print("answer is debug \(answer)")
        answer *= pk
        answer *= oneminusp
        self.answerfield.text = String(answer)
        
        
        
    }
    
    /* This method belongs to  JaapWijnen in the GitHub */
    func factorial(_ n: Int) -> Int {
        var n = n
        var result = 1
        while n > 1 {
            result *= n
            n -= 1
        }
        return result
    }
    /* This method belongs to  JaapWijnen in the GitHub */
    func combinations(_ n: Int, choose k: Int) -> Int {
        return permutations(n, k) / factorial(k)
    }
    
    /* This method belongs to  JaapWijnen in the GitHub */
    func permutations(_ n: Int, _ k: Int) -> Int {
        var n = n
        var answer = n
        for _ in 1..<k {
            n -= 1
            answer *= n
        }
        return answer
    }
    
    //  Credits: JaapWijnen----->    https://github.com/raywenderlich/swift-algorithm-club/tree/master/Combinatorics
    
}
