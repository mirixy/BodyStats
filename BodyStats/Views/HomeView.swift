//
//  HomeView.swift
//  BodyStats
//
//  Created by Miriam Renken on 10.12.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .white], startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
            VStack{
                Spacer()
                Text("Your Stats")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Spacer()
                VStack{
                    HStack{
                        Text("current BMI:")
                        Text(String(BMI().bmi))
                    }
                    HStack{
                        Text("current BF%:")
                        Text(String(BF().bodyfat))
                    }
                    Spacer()
                }
            }
            
        }.foregroundColor(.black)
            
            
        
    }
}

#Preview {
    HomeView()
}
