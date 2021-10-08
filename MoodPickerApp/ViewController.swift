//
//  ViewController.swift
//  MoodPickerApp
//
//  Created by agreyson on 10/4/21.
//

import UIKit

class ViewController: UIViewController {
    var moodModel = MoodModel()
    
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var moodPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        moodPicker.dataSource = self
        moodPicker.delegate = self
        
        moodLabel.textAlignment = .center
        moodLabel.text = moodModel.todaysMood.rawValue
        
        var row = 0
        for m in Mood.allCases {
            if moodLabel.text == m.rawValue {
                break
            } else {
                row += 1
            }
        }
        moodPicker.selectRow(row, inComponent: 0, animated: true)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Mood.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Mood.allCases[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let mood = Mood.allCases[row].rawValue
        moodLabel.text = mood
        moodModel.todaysMood = Mood(rawValue: mood)!
    }
}

