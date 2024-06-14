//
//  NotificationListView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 11/06/2024.
//

import SwiftUI

struct SectionData: Identifiable {
    let id = UUID()
    let header: String
}

struct NotificationListView: View {

    private let sections: [SectionData] = [
        SectionData(header: "Today"),
        SectionData(header: "Yesterday")
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(sections) { section in
                    Section(header: NotificationSectionHeader(title: section.header)) {
                        ForEach(0..<5, id: \.self) { index in
                            if index == 0 {
                                SwipeItem(content: {
                                    NotificationCard(notificationState: .highAlert, isRead: true)
                                }, swipeActions: {
                                    NotificationSwipeActionView(onDeleteButtonTap: {
                                        
                                    })
                                }, screenHeight: 70)
                            } else if index == 1 {
                                SwipeItem(content: {
                                    NotificationCard(notificationState: .warning, isRead: true)
                                }, swipeActions: {
                                    NotificationSwipeActionView(onDeleteButtonTap: {
                                        
                                    })
                                }, screenHeight: 70)
                            } else if index == 2 {
                                SwipeItem(content: {
                                    NotificationCard(notificationState: .lowBettery, isRead: true)
                                }, swipeActions: {
                                    NotificationSwipeActionView(onDeleteButtonTap: {
                                        
                                    })
                                }, screenHeight: 70)
                            } else {
                                SwipeItem(content: {
                                    NotificationCard(notificationState: .highAlert, isRead: false)
                                }, swipeActions: {
                                    NotificationSwipeActionView(onDeleteButtonTap: {
                                        
                                    })
                                }, screenHeight: 70)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
            .scrollIndicators(.never, axes: .vertical)
            .scrollContentBackground(.hidden)
            .background(CustomColors.lightGrayBackground)
        }
        .background(CustomColors.lightGrayBackground)
    }
}

#Preview {
    NotificationListView()
}
