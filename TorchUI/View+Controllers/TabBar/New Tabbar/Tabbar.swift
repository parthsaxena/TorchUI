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
    @Binding var selectedTab: Tab
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    if(tab == .sensor) {
                        ZStack {
                            Image("\(tab.self)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .foregroundStyle(selectedTab == tab ? Color("mainColor") : Color("secColor"))
                                .offset(y: -10)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.1)) {
                                        selectedTab = tab
                                    }
                                }
                        }
                        .dropShadow(type: .color(c: Color("mainColor").opacity(0.17)), radius: 17, offset: .init(x: 0, y: 8), spread: CGSize(width: 4, height: 4))
                        .dropShadow(type: .color(c: Color("mainColor").opacity(0.27)), radius: 30, offset: .init(x: 0, y: 24), spread: CGSize(width: 4, height: 4))
                    } else {
                        VStack {
                            Spacer()
                            Image("\(tab.self)")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 19, height: 19)
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
            }
            .frame(height: 48)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 39)
                    .foregroundStyle(Color.white)
            )
            .background(
                RoundedRectangle(cornerRadius: 39)
                .stroke(.white, lineWidth: 1)
            )
        }
        .dropShadow(type: .color(c: Color("fillColor").opacity(0.03)), radius: 8, offset: .init(x: 0, y: 8), spread: CGSize(width: 4, height: 4))
        .dropShadow(type: .color(c: Color("fillColor").opacity(0.08)), radius: 24, offset: .init(x: 0, y: 20), spread: CGSize(width: 4, height: 4))
    }
}

