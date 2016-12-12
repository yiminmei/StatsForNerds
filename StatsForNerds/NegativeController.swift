//
//  NegativeController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/2/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//

import UIKit

class NegativeController: UIViewController {
    
    @IBOutlet weak var kfieldx3: UITextField!
    @IBOutlet weak var rfieldx3: UITextField!
    @IBOutlet weak var pfieldx3: UITextField!
    @IBOutlet weak var answerx3: UITextField!
    
    
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
    // handles computation of negativebinomial distribution, uses alot of math
    @IBAction func onClick(){
        // input checking
        if let k: Int = Int( self.kfieldx3.text!),
            let r: Int = Int( self.rfieldx3.text!),
            let p: Double = Double( self.pfieldx3.text!){
            
            if( k <= 0 || r <= 0 || p <= 0 || p >= 1){
                answerx3.text = String( "Condition:k>0,r>0,0<p<1")
                return
            }
            let part1 :Double = Double(self.combinations(k+r-1, choose: k))
            var decoy: Double = Double( k - 1)
            var pk : Double = p
            print( "decoy is debug \(decoy)")
            while(decoy>0){
                print( "done it debug ")
                pk *= p
                decoy-=1
            }
            if( decoy == -1){
                pk = 1
            }
            var oneminusp : Double = 1-p
            var decoy2 = r-1
            print( "decoy 2 is debug \(decoy2)")
            while( decoy2 > 0){
                oneminusp *= 1-p
                decoy2-=1
            }
            if(decoy2 == -1){
                oneminusp = 1
            }
            let answer :Double =  Double( part1 * pk) * Double(oneminusp)
            
            self.answerx3.text = String(answer)
            
        }else{
             answerx3.text = String( "Condition:k>0,r>0,0<p<1")
            
            
        }

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

    
    
    
    
    
}
