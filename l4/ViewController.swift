//
//  ViewController.swift
//  l4
//
//  Created by Sashko Shel on 5/29/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(antimat("fuck you bitch"))
        print(sampler(["lada", "seda", "dela", "tama", "data"], "da"))
        
    }
    
    
    func antimat (_ str : String ) -> String {
        let badWords : Set<String> = ["fuck", "bitch"]
        var clearString = str
        
        for i in badWords {
            var replaceString = ""
            for _ in 0..<i.count {
                replaceString += "*"
            }
            clearString = clearString.lowercased().replacingOccurrences(of: i, with: replaceString)
        }
        return clearString
    }
    
    func sampler(_ strMass : [String], _ searched : String) -> [String] {
        var result : [String] = []
        
        for i in strMass {
            if i.contains(searched) {
                result.append(i)
            }
        }
        
        return result
    }
    
    
}

