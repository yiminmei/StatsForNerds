//
//  HypergeometricController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/2/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//

import UIKit

// this class handles the geometric distribution
class HypergeometricController: UIViewController {
    @IBOutlet weak var kfield2: UITextField!
    @IBOutlet weak var nfield2: UITextField!
    @IBOutlet weak var Kfieldx2: UITextField!
    @IBOutlet weak var Nfieldx2: UITextField!
    @IBOutlet weak var answerfield2: UITextField!
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    /* 
        compute the probababilty, uses alot of math
     */
    @IBAction func onClick(){
        // input checking
        if let k: Int = Int( self.kfield2.text!),
            let n: Int = Int( self.nfield2.text!),
            let K: Int = Int(self.Kfieldx2.text!),
            let N : Int = Int(self.Nfieldx2.text!){
            if( k <= 0 || n <= 0 || K <= 0 || N <= 0 ||  K >= N || k >= n){
                answerfield2.text = String( "Condition:k>0,n>0,K>0,N>0,K<N,k<n")
                return
            }
            let kchoosen: Double = Double(self.combinations( K, choose: k ) )
            print(" debug \(kchoosen)")
            let NminusKchoosenminusk: Double = Double (self.combinations( (N-K), choose: (n-k)))
            print(" debug \(NminusKchoosenminusk)")
            let Nchoosen: Double = Double(self.combinations(N, choose: n))
            print(" debug \(Nchoosen)")
            let answer :Double = (kchoosen * NminusKchoosenminusk) / Nchoosen
            answerfield2.text = String(answer )
            
        }else{
            answerfield2.text = String( "Condition:k>0,n>0,K>0,N>0,K<N,k<n")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //
        // Dispose of any resources that can be recreated.
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

