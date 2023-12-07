//
//  Tabbar.swift
//  TorchUI
//
//  Created by kashif on 11/26/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home
    case search
    case sensor
    case notification
    case setting
}

struct CustomTabBar: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            HStack {
                HStack(alignment: .center, spacing: 16) {
                    TabItem(tab: .home, selectedTab: $selectedTab)
                       
                    TabItem(tab: .search, selectedTab: $selectedTab)
                        
                }
                .padding(.leading, 20)
                
                ZStack {
                    Image("\(Tab.sensor.self)")
                        .frame(width: 70, height: 70)
                        .foregroundStyle(selectedTab == .sensor ? Color("mainColor") : Color("secColor"))
                        .offset(y: 10)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = .sensor
                            }
                        }
                }
                .dropShadow(type: .color(c: Color("mainColor").opacity(0.07)), radius: 7, offset: .init(x: 0, y: -2), spread: CGSize(width: -4, height: -4))
                .dropShadow(type: .color(c: Color("mainColor").opacity(0.07)), radius: 20, offset: .init(x: 0, y: 14), spread: CGSize(width: -4, height: -4))
                
                
                HStack(alignment: .center, spacing: 16) {
                    TabItem(tab: .notification, selectedTab: $selectedTab)
                       
                    
                    TabItem(tab: .setting, selectedTab: $selectedTab)
                       
                }
                .padding(.trailing, 20)
            }
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            
            .padding(.vertical, 10)
            .background(
                GlassyEffectView(effect: UIBlurEffect(style: (colorScheme == .dark) ? .dark : .light), cornerRadius: 36.0)
            )
            .dropShadow(type: .color(c: Color("fillColor").opacity(0.03)), radius: 8, offset: .init(x: 0, y: 8), spread: CGSize(width: 4, height: 4))
            .dropShadow(type: .color(c: Color("fillColor").opacity(0.08)), radius: 24, offset: .init(x: 0, y: 20), spread: CGSize(width: 4, height: 4))
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.home))
}

struct GlassyEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    var cornerRadius: CGFloat = 0
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
        uiView.layer.cornerRadius = cornerRadius
        uiView.clipsToBounds = true
        uiView.layer.borderWidth = 0.5
        uiView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

struct TabItem: View {
    let tab: Tab
    @Binding var selectedTab: Tab

    var body: some View {
        VStack {
            Spacer()
            Image("\(tab.self)")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 22, height: 22)
                .foregroundStyle(selectedTab == tab ? Color("mainColor") : Color("secColor"))
            Spacer()
            if(selectedTab == tab) {
                Circle()
                    .fill(Color("mainColor"))
                    .frame(width: 4, height: 4)
            }
        }
        .frame(width: 48, height: 48)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.1)) {
                selectedTab = tab
            }
        }
    }
}
