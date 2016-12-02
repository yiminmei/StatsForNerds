//
//  CheckListViewController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//

import UIKit


class CheckListViewController: UITableViewController{
    
    var questions: [Question] = []
    
    
    override func viewDidLoad(){
        super.viewDidLoad();
        questions.append ( Question( "Massachusetts", " How many ways can you arrange Math together in the word Massachusetts? " + "For Example: ssaMathcusets is one arrangement; asscuseMathts is also") )
        questions.append ( Question("Birthday Party", " Suppose you are in a unfamiliar class, there is a total of 40  students. What are the chances that there is more than 2 students sharing a common birthday? Common birthday includes month and day only. If you enter 100 of such classrooms, should you bet on them all ?"   ))
        questions.append ( Question( "Revenge Feels Good " , " Lets suppose you play rock-paper-scissors with your worst enemy. The rules has been twisted. The following table gives the possible winnings for you.\n\n                               Player 2\n \n                          R         P         S\n-----------------------------------\nYou          R|   -12         -7        18\n                P|    18         -3        -7\n                S|   -25         7         12   \n\n\n\n Assume the likelihood of choosing rock, paper and scissors is the same for you and your enemy, what is your expected winnings after 100 games ?"));
            
            
        questions.append ( Question(  "Show Me the Money" , "Suppose you have one dollar bill. The 1 dollar bill can be turned into pennys, nickels, dimes, quarters, one dollar coins of any assortment. How many different ways can you arrange a ten dollar bill by coins ? For example:1 dollar coin is considered one arrangement; 10 pennys, 3 quarter, 3 nickels is also "))
        
     
        
        
        
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning();
        
    }
 
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
       
        let number = indexPath.row
        
        if( number>=0 && number < questions.count){
            label.text = questions[number].name
            
        }
        
        return cell
    
    }
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    
   
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let question = questions[indexPath.row]
        performSegue(withIdentifier: "display", sender: question)
    }
 


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if(segue.identifier == "display"){
            let destination = segue.destination as! DescriptionController
            destination.question = sender as! Question
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
