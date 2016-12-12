//
//  Word.swift
//  StatsForNerds
//
//  Created by Yimin Mei on 12/1/16.
//  Copyright © 2016 Yimin Mei. All rights reserved.
//

import Foundation

//model for word, contains various code
class Word:NSObject, NSCoding {
    var name: String
    var meaning :String
    // initialization
    init( _ name : String, _ meaning: String){
        self.name = name;
        self.meaning = meaning;
    }
    // allows saving to file
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(meaning, forKey: "Meaning")
    }
    
    override init() {
        self.name = "What";
        self.meaning="What"
        super.init()
    }
    //allows loading from file
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        meaning = aDecoder.decodeObject(forKey: "Meaning") as! String
        super.init()
    }
    //Disclaimer: some of the code is take from CheckList app provided by Angus Yeung
    
}
