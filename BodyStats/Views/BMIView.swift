//
//  BMIView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct BMIView: View {
    @State public var height = ""
    @State public var weight = ""
    @State public var bmi = 0.0
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
                        TextField("1.80", text: $height)
                            .frame(width: 70.0).background(.white)
                            .foregroundColor(.black)
                        Text("m")
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
                    if bmi == 0.0 {
                        Text("Your BMI:").hidden()
                        Text(String(bmi)).hidden()
                    } else {
                        Text("Your BMI:").foregroundColor(.black)
                        Text(String(bmi)).foregroundColor(.black)
                    }
                }
                Spacer()
                HStack{
                    Button("Calc", systemImage: "arrow.right", action: {workaround()})
                    
                }
                
                Spacer()
            }
            
        }.safeAreaPadding()
        
        
    }
    func workaround() -> Void {
        bmi = CalculateBMI().calculate(weight: weight, height: height)
    }
}


#Preview {
    BMIView()
}
