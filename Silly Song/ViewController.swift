//
//  ViewController.swift
//  Silly Song
//
//  Created by Manish Ghumnani on 5/4/17.
//  Copyright © 2017 Manish Ghumnani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ name:Any) {
        
        let bananaFanaTemplate = [
            "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
            "Banana Fana Fo F<SHORT_NAME>",
            "Me My Mo M<SHORT_NAME>",
            "<FULL_NAME>"].joined(separator: "\n")

        
        if(!((nameField.text)?.isEmpty)!){
            lyricsView.text = lyricsForName(bananaFanaTemplate, name: nameField.text!)
        }
    }
}

func shortName(_ Name: String) -> String {
    var name = Name.lowercased()
    let vowels:[Character] = ["a","e","i","o","u"]
    
    for char in name.characters {
        if(!vowels.contains(char)){
            name = name.replacingOccurrences(of: String(char), with: "")
        }
        else{
            break
        }
    }
    
    return name
}




func lyricsForName(_ template:String, name: String) -> String {
    let shortenedName = shortName(name)
    var customTemplate = template.replacingOccurrences(of: "<FULL_NAME>", with: name)
    
    customTemplate =  customTemplate.replacingOccurrences(of: "<SHORT_NAME>", with: shortenedName)
    
    return customTemplate
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder() //on return - hide the keyboard and the 'editing did end' event ended
        return false //to prevent further responses to return key
    }
}


