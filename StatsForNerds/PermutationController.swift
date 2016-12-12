//
//  PermutationController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/2/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//


import UIKit
//handles the screen that controls permutations
class PermutationController: UIViewController {
    
    @IBOutlet weak var nfieldx5: UITextField!
    @IBOutlet weak var rfieldx5: UITextField!
    @IBOutlet weak var answerfieldx5: UITextField!
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
    // calculates permutation, uses alot of math
    @IBAction func onClick(){
        //input checking
        if let n: Int = Int( self.nfieldx5.text!),
            let r: Int = Int( self.rfieldx5.text!){
            
            if( n <= 0 || r <= 0 || r > n){
                answerfieldx5.text = String( "Condition: n>0 , r>0  ")
                return
            }
            answerfieldx5.text = String( self.permutations(n, r))
            
        }else{
            answerfieldx5.text = String( "Condition: n>0 , r>0   ")
    
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
