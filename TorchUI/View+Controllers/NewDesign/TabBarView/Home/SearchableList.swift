//
//  SearchableList.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 30/05/2024.
//

import SwiftUI


struct SearchableList: View {
    
    @Binding var selectedSegment: Int
    @State var searchResults: [String] = ["name 1", "name 1", "name 1", "name 1", "name 1", "name 1", "name 1", "name 1", "name 1", "name 1", "name 1", "name 1", "name 1"]
    @State private var searchQuery: String = ""
    
    var isSearching: Bool {
        return !searchQuery.isEmpty
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<searchResults.count, id: \.self) { index in
                    if selectedSegment == 0 {
                        if index == 0 {
                            SwipeItem(content: {
                                PropertyCard(propertyState: .highAlert, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 60)
                        } else if index == 1 {
                            SwipeItem(content: {
                                PropertyCard(propertyState: .warning, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 60)
                        } else if index == 2 || index == 3 {
                            SwipeItem(content: {
                                PropertyCard(propertyState: .normal, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 120)
                        } else {
                            SwipeItem(content: {
                                PropertyCard(propertyState: .normal, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 60)
                        }
                    } else {
                        if index == 1 {
                            SwipeItem(content: {
                                SensorCard(propertyState: .highAlert, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 60)
                        } else if index == 2 {
                            SwipeItem(content: {
                                SensorCard(propertyState: .disable, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 60)
                        } else if index == 3 {
                            SwipeItem(content: {
                                SensorCard(propertyState: .warning, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 60)
                        } else {
                            SwipeItem(content: {
                                SensorCard(propertyState: .normal, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 60)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
            .scrollIndicators(.never, axes: .vertical)
            .scrollContentBackground(.hidden)
            .background(Color.clear)
//            .searchable(text: $searchQuery, placement: .automatic, prompt: "Search Properties")
//            .textInputAutocapitalization(.never)
//            .onChange(of: searchQuery) {
//                self.fetchSearchResults(for: searchQuery)
//            }
        }
    }
}
