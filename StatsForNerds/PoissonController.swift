//
//  PoissonController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/2/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//

import UIKit
//handles the poison distribution screen
class PoissonController: UIViewController{
    
    @IBOutlet weak var lambda: UITextField!
    @IBOutlet weak var kfieldx4: UITextField!
    @IBOutlet weak var answerfieldx4: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad();
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning();
        
    }
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    //handles computation of poison distribution, contains alot of math
    @IBAction func onClick(){
        //input checking
        if let lambd: Int = Int( self.lambda.text!),
            let k: Int = Int( self.kfieldx4.text!){
            
            if( lambd <= 0 || k <= 0 ){
                answerfieldx4.text = String( "Condition: lambda>0 , k>0  ")
                return
            }
            var decoy:Double = Double( k - 1)
            var lambdapowerk : Double = Double( lambd )
            print( "decoy is debug \(decoy)")
            while(decoy>0){
                print( "done it debug ")
                lambdapowerk *= Double(lambd)
                decoy-=1
            }
            if(decoy == -1){
                lambdapowerk = 1
            }
            
            var epowerlambda:Double = 2.71828
            var decoy2 = lambd - 1
            print( "decoy 2 is debug \(decoy2)")
            while( decoy2 > 0){
                epowerlambda *= 2.71828
                decoy2-=1
            }
            if( decoy2 == -1){
                epowerlambda = 1
            }
            let factorialk: Double = Double( self.factorial(k))
            var answer : Double = lambdapowerk * ( 1/epowerlambda)
            answer = answer / factorialk
            print("debug \(lambdapowerk) ")
            print("debug \(epowerlambda) ")
            print("debug \(factorialk) ")
            answerfieldx4.text = String(answer)
        }else{
            answerfieldx4.text = String( "Condition: lambda>0 , k>0   ")
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
