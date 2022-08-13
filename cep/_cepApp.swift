//
//  _3234234App.swift
//  23234234
//
//  Created by Maria Novikova on 05.06.2022.
//

import SwiftUI

@available(iOS 16.0, *)
@main
struct _3234234App: App {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(designColors.TabGrayDark)
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().backgroundColor = UIColor(designColors.TabGray)
        
        //UITabBar.appearance().isTranslucent = false
        //UITabBar.appearance().tintColor = UIColor(designColors.TabBlue)
        //UITabBar.appearance().color
        //UITabBar.appearance().isOpaque = true
    }
    
    @State private var selection = 1
    
    var body: some Scene {
        
        WindowGroup {
            /*
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                
                viewCourses().tabItem {
                    Image("tab_learning").renderingMode(.template)
                    Text("Обучение")
                }.tag(1)
                
                Text("Tab Content Church").tabItem {
                    Image("tab_church").renderingMode(.template)
                    Text("Церковь")
                }.tag(2)
                
                Text("Tab Content Targets").tabItem {
                    Image("tab_target").renderingMode(.template)
                    Text("Достижения")
                }.tag(3)
                
                Text("Tab Content Profile").badge(0).tabItem {
                    Image("tab_profile").renderingMode(.template)
                    Text("Профиль")
                }.tag(4)
            }
            */
            viewCourses()
        }
    }
}
