//
//  PropertiesView.swift
//  TorchUI
//
//  Created by Parth Saxena on 6/26/23.
//

import SwiftUI
import SwiftUI_Shimmer

struct PropertiesView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showingSheet = false
    
    let tabs: [TabBarItemData] = [
        TabBarItemData(image: "home", selectedImage: "home", size: 24),
        TabBarItemData(image: "search", selectedImage: "web-icon", size: 24),
        TabBarItemData(image: "main-nav", selectedImage: "roster-icon", size: 54),
        TabBarItemData(image: "notif", selectedImage: "match-icon", size: 24),
        TabBarItemData(image: "settings", selectedImage: "match-icon", size: 24)]
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    @State var selectedIndex = 0
    
    var body: some View {
        ZStack {

            if SessionManager.shared.showSplashScreen {
                LoadingSplashScreen()
                    .onAppear(perform: hideSplashScreen)
            } else if !SessionManager.shared.propertiesLoaded || SessionManager.shared.unparsedProperties > 0 {
                LoadingPropertiesView(showingSheet: $showingSheet)
                VStack {
                    HeadingView()
                        .frame(alignment: .top)
                    
                    Spacer()

                    TabBarView(tabBarItems: tabs, selectedIndex: $selectedIndex)
                        .frame(alignment: .bottom)
                }
            } else if SessionManager.shared.properties.count > 0 {
                MainPropertiesView(showingSheet: $showingSheet)
                VStack {
                    HeadingView()
                        .frame(alignment: .top)
                    
                    Spacer()

                    TabBarView(tabBarItems: tabs, selectedIndex: $selectedIndex)
                        .frame(alignment: .bottom)
                }
            } else if SessionManager.shared.propertiesLoaded && SessionManager.shared.unparsedProperties == 0 {
                NoPropertiesView(showingSheet: $showingSheet)
                VStack {
                    HeadingView()
                        .frame(alignment: .top)
                    
                    Spacer()

                    TabBarView(tabBarItems: tabs, selectedIndex: $selectedIndex)
                        .frame(alignment: .bottom)
                }
            }
        }
        .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
        .sheet(isPresented: $showingSheet) {
            AddPropertySheetView()
                .presentationCornerRadius(25)
        }
    }
    
    func hideSplashScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SessionManager.shared.showSplashScreen = false
        }
    }
}


struct PropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesView()
    }
}
