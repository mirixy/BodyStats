//
//  BMIView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct BMIView: View {
    @EnvironmentObject var person: Person
    @State public var height = ""
    @State public var weight = ""
    var body: some View {
        ZStack{
            LinearGradient(colors: [.mint, .white], startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
            VStack{
                
                Text("BMI Calculator")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                
                VStack{
                    HStack{
                        Text("Height:")
                        TextField("180", text: $height)
                            .frame(width: 70.0).background(.white)
                            .foregroundColor(.black)
                        Text("cm")
                        Spacer()
                    }
                    HStack{
                        Text("Weight:")
                        TextField("75", text: $weight)
                            .frame(width: 70.0).background(.white)
                            .foregroundColor(.black)
                        Text("kg")
                        Spacer()
                    }
                    
                }
                Spacer()
                HStack{
                    // only show BMI when you enter your data and hit calc
                    if person.bmi == 0.0 {
                        Text("Your BMI:").hidden()
                        Text(String(person.bmi)).hidden()
                    } else {
                        Text("Your BMI:").foregroundColor(.black)
                        Text(String(person.bmi)).foregroundColor(.black)
                    }
                }
                Spacer()
                HStack{
                    Button(action: set_data) {
                        Text("Calculate")
                    }
                    .frame(width: 150, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                }
                
                Spacer()
            }
            
        }.safeAreaPadding()
        
        
    }
    
        func set_data() {
            person.weight = weight
            person.height = height
            calc()
        }
        func calc() {
            person.calculate(weight: weight, height: height)
        }
        
    
}



#Preview {
    BMIView()
        .environmentObject(Person())
}
