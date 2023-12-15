//
//  SwiftUIView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var person = Person()
    
    var body: some View {
        
            //LinearGradient(colors: [.mint, .white], startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
            
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            HomeView().tabItem { Text("Home") }.tag(1)
            BodyFatView().tabItem {Text("BF%")}.tag(2)
            Settings().tabItem {Text("Settings")}.tag(3)
        }.environmentObject(person)
            

     
    }
}

#Preview {
    TabBarView()
        
}
