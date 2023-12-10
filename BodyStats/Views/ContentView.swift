//
//  ContentView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack{
            //LinearGradient(colors: [.mint, .white], startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
            VStack{
                TabBarView()
            }
            
            
        }
    }
    
    
}



#Preview {
    ContentView()
}
