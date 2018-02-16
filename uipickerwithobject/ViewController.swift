//
//  ViewController.swift
//  uipickerwithobject
//
//  Created by Ron Rith on 2/16/18.
//  Copyright © 2018 Ron Rith. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate
{
    
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var samplePickerView: UIPickerView!
    
    var components = [[String]]()
    var resultString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        samplePickerView.dataSource = self
        samplePickerView.delegate = self
        
        components = numberPickerComponents(from: "na")
    }
    

    func numberPickerComponentCustom(from char:Character) -> [String]{
        switch char{
        case "n":
            return ["Health","Sport","Nature"]
        case "a":
            return ["Author1","Author2","Author3"]
        default:
            return [String(char)]
        }
    }
    
    func numberPickerComponents(from string:String)->[[String]]{
        var components = [[String]]()
        for char in string.characters{
            components += [numberPickerComponentCustom(from:char)]
        }
        return components
    }
    
    func resetPicker(){
        samplePickerView.reloadAllComponents()
        for index in 0..<components.count{
            samplePickerView.selectRow(0, inComponent: index, animated: true)
            
        }
    }
    
    //:MARK - Delegates and data sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return components.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return components[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return components[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultString = ""
        for index in 0..<components.count{
            let digit = components[index][samplePickerView.selectedRow(inComponent: index)]
            if digit.characters.count > 1 {//add space if more than one character
            resultString += " " //add space if more than one character
            }
            resultString += digit
        }
        displayLabel.text = resultString
    }

}

