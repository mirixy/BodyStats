//
//  BodyFatView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct BodyFatView: View {
    @EnvironmentObject var person: Person
    
    @State var height = ""
    @State var weight = ""
    @State var neck = ""
    @State var waist = ""
    @State var hip = ""
    
    
    enum Gender: String, CaseIterable, Identifiable {
        case Male, Female
        var id: Self { self }
        
        
    }
    @State private var selectedGender: Gender = .Male
    @State private var gender = ""
    
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
                    if person.bodyfat == 0.0 {
                        HStack{
                            Text("Your Bodyfat %:")
                            Text(String(person.bodyfat))
                        }.hidden()
                    } else {
                        HStack{
                            Text("Your Bodyfat %:")
                            Text(String(person.bodyfat)).foregroundColor(.black)
                        }
                    }
                    Spacer()
                    Button(action: set_data) {
                        Text("Calculate")
                    }
                    .frame(width: 150, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    Spacer()
                }
     
            }
                
        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
    }
    
    func set_data() {
        person.weight = weight
        person.height = height
        person.neck = neck
        person.waist = waist
        person.hip = hip
        gender = (selectedGender.rawValue)
        person.set_gender(gender: gender)
        calc()
    }
    func calc() {
        person.calculateBF()
    }
    
}


#Preview {
    BodyFatView()
        .environmentObject(Person())
        
}
