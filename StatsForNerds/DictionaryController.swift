//
//  CheckListViewController.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//

import UIKit


class DictionaryController: UITableViewController{
    
    var words: [Word] = []
    

    override func viewDidLoad(){
        super.viewDidLoad();
        words.append( Word("Combination","a joining or merging of different parts or qualities in which the component elements are individually distinct." ))
        words.append( Word("Permutation","a way, especially one of several possible variations, in which a set or number of things can be ordered or arranged." ))
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning();
        
    }
    
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordListItem", for: indexPath)
        
        let label = cell.viewWithTag(2000) as! UILabel
        
        let number = indexPath.row
        
        if( number>=0 && number < words.count){
            label.text = words[number].name
            
        }
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return  words.count
    }
    
    
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let question = words[indexPath.row]
        performSegue(withIdentifier: "displaydictionary", sender: question)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "displaydictionary"){
            let destination = segue.destination as! DefinitionController
            destination.word = sender as! Word
            
        }
 
        
        
    }
    
    
    
    
    
    
    
    
    
}
