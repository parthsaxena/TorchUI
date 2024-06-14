//
//  HomeViewList.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 30/05/2024.
//

import SwiftUI


struct HomeViewList: View {
    
    @Binding var selectedSegment: Int

    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10, id: \.self) { index in
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
                        } else if index == 8 || index == 9 {
                            SwipeItem(content: {
                                PropertyCard(propertyState: .highAlert, index: index)
                            }, swipeActions: {
                                SwipeActionsView(onMuteButtonTap: {
                                    
                                }, onDeleteButtonTap: {
                                    
                                })
                            }, screenHeight: 60)
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
                        if index == 0 {
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
                        } else if index == 1 {
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
            .background(CustomColors.lightGrayBackground)
        }
        .background(CustomColors.lightGrayBackground)
    }
}
