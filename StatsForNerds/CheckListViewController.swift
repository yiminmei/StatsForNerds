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
    
    
    //adds questions to display and read
    override func viewDidLoad(){
        
        super.viewDidLoad();
        questions.append ( Question( "Massachusetts", " How many ways can you arrange the word Math together in the word Massachusetts? " + "For Example: ssaMathcusets is one arrangement; asscuseMathts is also\n\n\n\n\n Treat Math as a standalone object. Then there are 10 objects to arrange. However there are duplicates of 4s. So apply the general combination formula and you have 10!/4!= 151,200") )
        questions.append ( Question("Birthday Party", " Suppose you are in a unfamiliar class, there is a total of 35  students. What are the chances that there is more than 2 students sharing a common birthday? Common birthday includes month and day only. If you enter 100 of such classrooms, should you bet on them all ?\n\n\n\n The probability of all of them having a different birthday is permutation(365,35)/ 365^35 = 0.1825. So the probablity of them not having a common birthday is 1- 0.1856 = 0.813. You are likely to win the bet, so bet all the time!"   ))
        questions.append ( Question( "Revenge Feels Good " , " Lets suppose you play rock-paper-scissors with your worst enemy. The rules has been twisted. The following table gives the possible winnings for you.\n\n                               Player 2\n \n                          R         P         S\n-----------------------------------\nYou          R|   -12         -7        18\n                P|    18         -3        -7\n                S|   -25         7         12   \n\n\n\n Assume the likelihood of choosing rock, paper and scissors is the same for you and your enemy, what is your expected winnings after 100 games ?\n\n\n Your expected winning per game is 1 dollars, in one hundred games, you should win 100 dollars."));
        
        questions.append( Question("Exam score","Suppose from your experience of taking exams, you know that you score an average of 70% on them. In addition you are certain that score varies around 20%(varience). What is the probability you will earn 90% for your next exam?\n\n\n\n The mean is 70 and varience is 20 here. Using normal standardization for the normal distribution, 90-70/20 = 1. The standard normal distribution table yields 0.84134. So you have 84% chance "))
        
        questions.append( Question("Flipping coins", "You flip 10 coins. What is the probability there will be only 3 heads? \n\n\n\n The probability of heads is 0.5, so binomial(3,10,0.5) = 0.117"))
        
        questions.append( Question("Deck of Cards","How many combinations can you have with 13 cards from a deck of 52 cards? \n\n\n\n (52 choose 13)= 6.35E11"))
        
        questions.append( Question("Bad Grades","In a class of 40 students, there are 10 students that are performing poorly. You chose ten of students randomly. What are the odds that 5 of the selected are performing poorly? \n\n\n The total population is 40. Amount of success in total population is 10. Sample size is 10. You want to have 5 success from sample size. So it will be the hypergeometric distribution. Hypergeometric(5,10,10,40)= 0.04236" ) )
        
        questions.append( Question("Wine bottles","There are ten wine bottles. You can only drink one wine at time and you must finish all of them. In how many ways can you drink them ?\n\n\n\n\n You have 10 wines to choose, followed by 9, followed by 8 ... followed by 1. So it will be 10*9*8 ...*1 = 10!=3628800"))
        questions.append( Question("Sets","The set of Event A is a set of integers[1,5,7,8,2] and the set of Event B is also a set of integers [8,2,45,0]. \nWhat is the union of Event A and Event B?\n What is the intersection of Event A and Event B ?\n\n\n\nEvent A union Event B = [1,5,7,8,2,45,0]. \nEvent A intersect Event B= [8,2]"))
        
        questions.append( Question("I am Lucky","What are the odds of getting 10 heads from flipping 10 coins?\n\n\n This can be solved logically (1/2)^10 or binomial(10,10,0.5)=0.5^10. 0.5^10= 0.0009765 =0.097% chance"))
        
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning();
        
    }
 
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    // sets up table row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
       
        let number = indexPath.row
        
        if( number>=0 && number < questions.count){
            label.text = questions[number].name
            
        }
        
        return cell
    
    }
    // returns the number of rows
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    // handles clicking events that sent user to another screen
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
