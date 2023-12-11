//
//  TabBarView.swift
//  TorchUI
//
//  Created by Parth Saxena on 6/28/23.
//

import SwiftUI

struct TabBarView: View {

    @Environment(\.colorScheme) var colorScheme
    
    let tabBarItems: [TabBarItemData]
    let height: CGFloat = 100
    let width: CGFloat = UIScreen.main.bounds.width
    let opacity = 0.2
    let shadowRadius: CGFloat = 5.0
    let shadowX: CGFloat = 0.0
    let shadowY: CGFloat = 4.0
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        ZStack {
            HStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                        .frame(width: width, height: height)
                        .padding(.top, 30)
                        .opacity(0.01)
                    VisualEffectView(effect: UIBlurEffect(style: (colorScheme == .dark) ? .dark : .light))
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: width, height: height)
                        .padding(.top, 30)
                    HStack {
                        Spacer()
                        ForEach(tabBarItems.indices) { index in
                            let item = tabBarItems[index]
                            Button {
                                self.selectedIndex = index
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                            } label: {
                                let isSelected = selectedIndex == index
                                TabBarItemView(data: item, isSelected: isSelected)
                            }
                            Spacer()
                        }
                    }
                }
            }
            .frame(width: width, height: height)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    @State static var selectedIndex: Int = 0
    
    static var previews: some View {
        PropertiesView()
    }
}
