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
        print(antimat("fuck you bitch"))
        
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
}

