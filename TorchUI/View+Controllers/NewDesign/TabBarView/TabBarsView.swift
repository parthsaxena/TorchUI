//
//  TabBarsView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/05/2024.
//

import SwiftUI

struct TabBarsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isViewAnalytics: Bool = false
    
    var body: some View {
        ZStack {
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
                        Image("Main_nav")
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
            .accentColor(.clear)
            .tint(CustomColors.TorchRed)
            .onAppear() {
//                            UITabBar.appearance().backgroundColor = UIColor(CustomColors.tabBarBackground.opacity(0.35))
//                UITabBar.appearance().barTintColor = .white.withAlphaComponent(0.1)
                let appearance = UITabBarAppearance()
                UITabBar.appearance().scrollEdgeAppearance = appearance
                UITabBar.appearance().unselectedItemTintColor = UIColor(CustomColors.darkGray)
                UITabBar.appearance().selectionIndicatorImage = nil
            }
        }
    }
}

#Preview {
    TabBarsView()
}
