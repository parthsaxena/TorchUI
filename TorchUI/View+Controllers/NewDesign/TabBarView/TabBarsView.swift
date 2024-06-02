//
//  TabBarsView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/05/2024.
//

import SwiftUI

struct TabBarsView: View {
    
    @State private var isViewAnalytics: Bool = false
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("")
                    Image("tabbar-home")
                        .renderingMode(.template)
                }
            NotificationsView()
                .tabItem {
                    Text("")
                    Image("tabbar-bell")
                        .renderingMode(.template)
                }
            TorchView()
                .tabItem {
                    Text("")
                    Image("tabbar-torch")
//                        .frame(width: 65, height: 65)
                }
            AnalyticsSwiftUIView(viewAnalytics: $isViewAnalytics)
                .tabItem {
                    Text("")
                    Image("tabbar-linechart")
                        .renderingMode(.template)
                }
            SettingsView()
                .tabItem {
                    Text("")
                    Image("tabbar-settings")
                        .renderingMode(.template)
                }
        }
        .accentColor(CustomColors.TorchRed)
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(CustomColors.tabBarBackground.opacity(0.7))
            UITabBar.appearance().barTintColor = UIColor(CustomColors.tabBarBackground.opacity(0.7))
            UITabBar.appearance().unselectedItemTintColor = UIColor(CustomColors.darkGray)
            UITabBar.appearance().selectionIndicatorImage = nil
        }
    }
}

#Preview {
    TabBarsView()
}
