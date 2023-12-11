//
//  DataModel.swift
//  BodyStats
//
//  Created by Miriam Renken on 11.12.23.
//

import Foundation


class Person: ObservableObject {
    // Personal Infos
    @Published var id = UUID()
    @Published var name: String = ""
    @Published var height: String = ""
    @Published var weight: String = ""
    @Published var goal: Double = 0.0
    @Published var gender: String = ""
    @Published var bmi: Double = 0.0
    @Published var bodyfat: Double = 0.0
    
    // Body Fat  Specefic
    @Published var neck: String = ""
    @Published var waist: String = ""
    @Published var hip: String = ""
    @Published var isWomen: Bool = false
    
    
    // Functions
    // set gender
    func set_gender(gender: String) {
        self.gender = gender
        if self.gender == "Female" {
            isWomen = true
            print("Status Woman: ", isWomen)
        }
    }
    
    // Round Double
    func roundToPlaces(value:Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(value * divisor) / divisor
    }
    
    // Calculate BMI
    func calculate(weight:String, height:String) {
        let w = Double(weight)
        var h = Double(height)
        h = h! / 100
        var bm = (w! / (h! * h!))
        bm = roundToPlaces(value: bm, places: 2)
        self.bmi = bm
        print(bm)
        
        
    }
    
    
    // Get BMI
    func get_bmi() -> Double{
        return self.bmi
    }
    
    // Set BMI
    func set_bmi(bmi:Double) {
        self.bmi = bmi
    }
    
    // BF Calculate
    func calculateBF() {
        let height = Double(height)
        let weight = Double(weight)
        let neck = Double(neck)
        let waist = Double(waist)
        let hip = Double(hip)
        var firstLog = 0.0
        let secLog = log10(height!)
        var bf = 0.0
        if self.isWomen == true {
            firstLog = log10((waist! + hip!) - neck!)
            bf = (495 / (1.29579 - (0.35004 * firstLog) + (0.22100 * secLog)) - 450)
        } else{
            firstLog = log10(waist! - neck!)
            bf = (495 / (1.0324 - (0.19077 * firstLog) + (0.15456 * secLog)) - 450)
        }
        self.bodyfat = roundToPlaces(value: bf, places: 2)
        print("Here: " , self.isWomen , bf)
        
        
    }
}


    

    

