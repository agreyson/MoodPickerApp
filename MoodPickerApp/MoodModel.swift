//
//  MoodModel.swift
//  MoodPickerApp
//
//  Created by agreyson on 10/7/21.
//

import Foundation

let persistenceKey = "Today's Mood"

enum Mood: String, CaseIterable {
    case happy = "happy"
    case sad = "sad"
    case excited = "excited"
    case goofy = "goofy"
    case bored = "bored"
    case sleepy = "sleepy"
    case cranky = "cranky"
}

struct MoodModel {
    var todaysMood: Mood {
        didSet {
            UserDefaults.standard.set(todaysMood.rawValue, forKey: persistenceKey)
        }
    }
    
    init(){
        let value = UserDefaults.standard.string(forKey: persistenceKey)
        todaysMood = Mood(rawValue: value ?? Mood.happy.rawValue)!
    }
}
