//
//  ViewController.swift
//  OnlyNumbers
//
//  Created by X901 on 03/09/2018.
//  Copyright © 2018 X901. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    let regularExpression = RegularExpression()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func checkTapped(_ sender: UIButton) {
        
      let string =  checkText(string: textField.text!)
        
        print(string)
    }
    

    func checkText(string: String) -> Bool  {
        

        let matched = regularExpression.matches(for: "^[0-9]+$", in: string)
        
        
        if matched != [] {
      
            return true
         
        }else {
            
            let alert = UIAlertController(title: "Warning", message: "It Should Be Numbers Only!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            }))
            self.present(alert, animated: true, completion: nil)

           return false
        }
    }


}

class RegularExpression  {
    
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        
           range: NSRange(text.startIndex..., in: text))
            
            var newString = ""
            return results.map {
                if let text2 = Range($0.range, in: text) {
                    newString = String(text[text2])
                }
                return newString
                
            }
            
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
}
}



