//
//  Settings.swift
//  BodyStats
//
//  Created by Miriam Renken on 14.12.23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var person: Person
    @State var name = "Max Mustermann"
    @State var height = "180"
    @State var weight = "75"
    var body: some View {
        ZStack{
            LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).ignoresSafeArea()
            VStack {
                VStack{
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    VStack{
                        HStack {
                            VStack {
                                Text("Name: ")
                                Text("Height: ")
                                Text("Start weight: ")
                            }
                            VStack {
                                TextField(name, text: $name)
                                    .background(.white)
                                    .frame(width:200)
                                TextField(height, text: $height)
                                    .background(.white)
                                    .frame(width:200)
                                TextField(weight, text: $weight)
                                    .background(.white)
                                    .frame(width:200)
                            }
                            
                        }
                      
                    }
                    Spacer()
                    Button(action: save){
                        Text("Save")
                            .frame(width: 150, height: 50)
                            .background(.orange)
                            .foregroundColor(.white)
                            
                    }
                    Spacer()
                }
                Spacer()
            }
        }.safeAreaPadding()
    }
                           
    func save() {
        person.save_person(name: name, height: height, weight: weight)
                    }
}

#Preview {
    Settings()
        .environmentObject(Person())
}
