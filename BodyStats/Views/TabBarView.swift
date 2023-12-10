//
//  SwiftUIView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            NavigationStack {
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink("Home", destination: ContentView())
                    Spacer()
                    NavigationLink("BMI", destination: ContentView())
                    Spacer()
                    NavigationLink("BF%", destination: ContentView())
                    Spacer()
                }
                
            }
               
            
        }
        
    }
}

#Preview {
    SwiftUIView()
}
