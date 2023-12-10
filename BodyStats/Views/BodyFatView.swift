//
//  BodyFatView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct BodyFatView: View {
    @State var height = BF().height
    @State var weight = BF().weight
    @State var neck = BF().neck
    @State var waist = BF().waist
    @State var hip = BF().hip
    @State var bodyfat = BF().bodyfat
    
    enum Gender: String, CaseIterable, Identifiable {
        case Male, Female
        var id: Self { self }
        
        
    }
    @State private var selectedGender: Gender = .Female
    var body: some View {
        ZStack{
            LinearGradient(colors: [.orange, .white], startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            VStack{
                Text("Body Fat")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("Data")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                HStack {
                    Spacer()
                    Text("Gender")
                    Picker("Gender", selection: $selectedGender) {
                        ForEach(Gender.allCases) { gender in
                            Text(gender.rawValue.capitalized)
                        }
                    }
                    Spacer()
                }
                VStack{
                    HStack{
                        Spacer()
                        Text("Height:")
                        TextField("180", text: $height)
                            .frame(width: 50.0).background(.white)
                            .foregroundColor(.black)
                        Text("cm")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Neck:")
                        TextField("30", text: $neck)
                            .frame(width: 50.0).background(.white)
                            .foregroundColor(.black)
                        Text("cm")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Waist:")
                        TextField("90", text: $waist)
                            .frame(width: 50.0).background(.white)
                            .foregroundColor(.black)
                        Text("cm")
                        Spacer()
                    }
                    
                    if selectedGender.rawValue != "Female" {
                        HStack{
                            Spacer()
                        }
                    }
                    else {
                        HStack{
                            Spacer()
                            Text("Hip:")
                            TextField("30", text: $hip)
                                .frame(width: 50.0).background(.white)
                                .foregroundColor(.black)
                            Text("cm")
                            Spacer()
                        }
                    }
                    
                    HStack{
                        Spacer()
                        Text("Weight:")
                        TextField("75", text: $weight)
                            .frame(width: 50.0).background(.white)
                            .foregroundColor(.black)
                        Text("kg")
                        Spacer()
                    }
                    Spacer()
                    if bodyfat == 0.0 {
                        HStack{
                            Text("Your Bodyfat %:")
                            Text(String(bodyfat))
                        }.hidden()
                    } else {
                        HStack{
                            Text("Your Bodyfat %:")
                            Text(String(bodyfat)).foregroundColor(.black)
                        }
                    }
                    Spacer()
                    Button(action: calculateBF) {
                        Text("Calculate")
                    }
                    .frame(width: 150, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    Spacer()
                }
     
            }
                
        }.foregroundColor(.black)
            
    }
    func calculateBF() -> Void {
        var height = Double(height)
        var weight = Double(weight)
        var neck = Double(neck)
        var waist = Double(waist)
        var hip = Double(hip)
        var gender = selectedGender.rawValue
        var firstLog = 0.0
        var secLog = log10(height!)
        var bf = 0.0
        if gender != "Male" {
            firstLog = log10((waist! + hip!) - neck!)
            bf = (495 / (1.29579 - (0.35004 * firstLog) + (0.22100 * secLog)) - 450)
        } else{
            firstLog = log10(waist! - neck!)
            bf = (495 / (1.0324 - (0.19077 * firstLog) + (0.15456 * secLog)) - 450)
        }
        bodyfat = Rounder().roundToPlaces(value: bf, places: 2)
        
    }
}

#Preview {
    BodyFatView()
}
