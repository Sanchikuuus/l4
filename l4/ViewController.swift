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
        //print(sampler(["lada", "seda", "dela", "tama", "data"], "da"))
        //print(transliter("ТеСт ТеКсТа ЗаБоРчИкОм"))
        //print(sorter([5, 7, 3, 7, 7, 9, 3, 5, 1, 2, 3, 4, 6, 8, 0]))
        //print(checkPass("123zA!"))
        //print(addSpliter("123456789"))
        //print(revers("abcdef"))
        print(splitNameSurname("SashkoShel"))
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
    
    func transliter(_ str : String) -> String {
        var convertedStr : String = ""
        let dictionary: [String: String] = ["а" : "a", "б" : "b", "в" : "v", "г" : "g", "д" : "d", "е" : "e", "ё" : "e", "ж" : "j", "з" : "z", "и" : "i", "й" : "i", "к" : "k", "л" : "l", "м" : "m", "н" : "n", "о" : "o", "п" : "p", "р" : "r", "с" : "s", "т" : "t", "у" : "u", "ф" : "f", "х" : "h", "ц" : "c", "ч" : "ch", "ш" : "sh", "щ" : "sc", "ъ" : "", "ы" : "y", "ь" : "", "э" : "e", "ю" : "iu", "я" : "ia", " ": " "]
        
        for i in str {
            if i.isLowercase {
                convertedStr += dictionary[String(i)]!
            } else {
                convertedStr += dictionary[String(i).lowercased()]!.uppercased()
            }
        }
        
        return convertedStr
    }
    
    func sorter(_ mass : [Int]) -> [Int] {
        var sortMass = Array(Set(mass))
        var needSort = true
        
        while needSort {
            needSort = false
            for i in 0..<sortMass.count - 1 {
                if sortMass[i] > sortMass[i+1] {
                    ( sortMass[i], sortMass[i+1] ) = ( sortMass[i+1], sortMass[i] )
                    needSort = true
                }
            }
        }
        
        return sortMass
    }
    
    func checkPass(_ str : String) -> Int {
        var strong = 0
        let startEndMass : [[Int]] = [ [48, 57], [97, 122], [65, 90], [33, 47] ]
        
        for mass in startEndMass {
            for i in mass[0]...mass[1] {
                if str.contains(Character(UnicodeScalar(i)!)) {
                    strong += 1
                    break
                }
            }
        }
        return strong == 4 ? 5 : strong
    }
    
    func addSpliter(_ str : String) -> String {
        let result : NSMutableString = NSMutableString(string: str)
        let comas = str.count / 3 - (str.count % 3 == 0 ? 1 : 0)
        
        for i in 1...comas {
            result.insert(",", at: (str.count) - i * 3 )
        }
        
        return result as String
    }
    
    func revers(_ str : String) -> String {
        var result = Array(str)
        let length = str.count - 1
        
        for i in 0...(length / 2) {
            (result[i], result[length-i]) = (result[length-i], result[i])
        }
        
        return String(result)
    }
    
    func splitNameSurname (_ str : String) -> [String] {
        for i in 1..<str.count {
            if str[String.Index(encodedOffset: i)].isUppercase {
                let strIndex = String.Index(encodedOffset: i)
                let str1 = str[str.startIndex..<strIndex]
                let str2 = str[strIndex..<str.endIndex]
                let str3 = str1 + " " + str2
                return [String(str1), String(str2), String(str3)]
            }
        }
        return ""
    }
}

