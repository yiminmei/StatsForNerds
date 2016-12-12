//
//  CombinationController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/2/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//


import UIKit
// controls the screen that solves combinations
class CombinationController: UIViewController {


    @IBOutlet weak var rfieldx6: UITextField!
    @IBOutlet weak var nfieldx6: UITextField!
    @IBOutlet weak var answerfieldx6: UITextField!
    
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
    // handles computation , uses alot of math
    @IBAction func onClick(){
            //input checking
        if let n: Int = Int( self.nfieldx6.text!),
            let r: Int = Int( self.rfieldx6.text!){
            
            if( n <= 0 || r <= 0 || r > n){
                answerfieldx6.text = String( " Condition: n>0 , r>0   ")
                return
            }
            answerfieldx6.text = String( self.combinations(n, choose: r))
            
        }else{
            answerfieldx6.text = String( "Condition: n>0 , r>0   ")
            
            
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
    
    
    //  Credits: JaapWijnen----->    https://github.com/raywenderlich/swift-algorithm-club/tree/master/Combinatorics
    
    
    
    
}
