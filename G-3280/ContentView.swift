//
//  ContentView.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/04/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    let unselectedColor = Color(hex: "B1B1B1")
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem {
                    selectedTab == 0 ? Image("homeFill") : Image("home")
                    Text("홈")
                }
                .tag(0)
            
            MissionView()
                .tabItem {
                    selectedTab == 1 ? Image("missionFill") : Image("mission")
                    Text("미션")
                }
                .tag(1)
            
            EvaluationView()
                .tabItem {
                    selectedTab == 2 ? Image("evaluationFill") : Image("evaluation")
                    Text("평가")
                }
                .tag(2)
            
            SettingView()
                .tabItem {
                    selectedTab == 3 ? Image("settingFill") : Image("setting")
                    Text("더보기")
                }
                .tag(3)
        }
        .tint(.customDarkGreen)

    }
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(unselectedColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
