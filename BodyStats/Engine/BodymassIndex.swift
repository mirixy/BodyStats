//
//  BodymassIndex.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import Foundation

class BMI {
    public var height: String = "185"
    public var bmi: Double = 0.0
}

class BF {
    public var height: String = "180"
    public var weight: String = "75"
    public var waist: String = "90"
    public var neck: String = "30"
    public var hip: String = "90"
    public var bodyfat:Double = 0.0
}

class Rounder {
    func roundToPlaces(value:Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(value * divisor) / divisor
    }
}

class CalculateBMI {
    
    func calculate(weight:String, height:String) -> Double {
        var w = Double(weight)
        var h = Double(height)
        var bm = (w! / (h! * h!))
        bm = Rounder().roundToPlaces(value: bm, places: 2)
        print(bm)
        return bm
        
    }
    
    func get_bmi(bmi:Double) -> Double{
        return bmi
    }
}


