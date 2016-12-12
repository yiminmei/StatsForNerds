//
//  Story.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//
import UIKit

//model for representing Questions
class Question{
    
    var name : String
    var description : String
// initializer
    init( _ name : String , _ description : String){
        self.name = name;
        self.description = description;
        
    }
}
