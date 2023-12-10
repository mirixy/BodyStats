//
//  SwiftUIView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
            //LinearGradient(colors: [.mint, .white], startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
            
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            HomeView().tabItem { Text("Home") }.tag(1)
            BMIView().tabItem { Text("BMI") }.tag(2)
            BodyFatView().tabItem {Text("BF%")}.tag(3)
        }

     
    }
}

#Preview {
    TabBarView()
}
