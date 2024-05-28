//
//  HomeView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/05/2024.
//

import SwiftUI
import AmplifyImage

struct HomeView: View {
    
    @State private var selectedSegment = 0
    @State private var isSheetPresented = false
    @State private var isEmpty = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("All assets")
                        .font(.custom("Manrope-SemiBold", size: 34))
                        .foregroundColor(CustomColors.darkGray)
                        .kerning(-2)
                    Spacer()
                    Circle()
                        .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                        .frame(width: 32, height: 32)
                        .overlay(
                            Image("home-addIcon")
                                .background(.white)
                        )
                        .background(.white)
                        .onTapGesture {
                            isSheetPresented = true
                        }
                }
                .padding()
                PickerView(segmentButtonTap: { value in
                    selectedSegment = value
                })
                .frame(height: 44)
                .padding(.horizontal)
                Spacer()
                if isEmpty {
                    VStack {
                        Text(selectedSegment == 0 ? "There's no property here yet" : "There's no sensors here yet").tag(0)
                            .font(.custom("Manrope-Regular", size: 14))
                        Circle()
                            .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                            .frame(width: 52, height: 52)
                            .overlay(
                                Image("home-addIcon")
                                    .background(.white)
                            )
                            .background(.white)
                            .onTapGesture {
                                
                            }
                    }
                    .background(.clear)
                } else {
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
                }
            }
            .background(CustomColors.lightGrayBackground)
        }
        .sheet(isPresented: $isSheetPresented) {
            VStack {
                AddSensorOrPropertyView(headerName: "Options", onCrossButtonTap: {
                    isSheetPresented = false
                }, onAddSensorButtonTap: {
                    
                }, onCreatePropertyButtonTap: {
                    
                })
            }
            .presentationDetents([.height(220.0), .height(220)])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(true)
        }
    }
}

struct SwipeActionsView: View {
    
    var onMuteButtonTap: () -> Void
    var onDeleteButtonTap: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(CustomColors.WarningYellow)
                    VStack {
                        Text("")
                        Image("property-mute")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Text("Edit")
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(.white)
                        Text("")
                    }
                }
                .frame(width: 80, height: geometry.size.height + 15)
                .onAppear {
                    self.onMuteButtonTap()
                }
                ZStack {
                    Rectangle()
                        .fill(CustomColors.TorchRed)
                    VStack {
                        Text("")
                        Image("property-trash")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Text("Delete")
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(.white)
                        Text("")
                    }
                }
                .frame(width: 80, height: geometry.size.height + 15)
                .onAppear {
                    self.onDeleteButtonTap()
                }
            }
            .clipShape(RoundedCorner(topLeft: 0, topRight: 22, bottomLeft: 0, bottomRight: 22))
            .padding(.leading, 5)
            .padding(.top, -7.5)
        }
    }
}

#Preview {
    HomeView()
}

struct RoundedCorner: Shape {
    var topLeft: CGFloat = 0
    var topRight: CGFloat = 0
    var bottomLeft: CGFloat = 0
    var bottomRight: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height

        let tr = min(min(self.topRight, height / 2), width / 2)
        let tl = min(min(self.topLeft, height / 2), width / 2)
        let bl = min(min(self.bottomLeft, height / 2), width / 2)
        let br = min(min(self.bottomRight, height / 2), width / 2)

        path.move(to: CGPoint(x: width / 2.0, y: 0))
        path.addLine(to: CGPoint(x: width - tr, y: 0))
        path.addArc(center: CGPoint(x: width - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: width, y: height - br))
        path.addArc(center: CGPoint(x: width - br, y: height - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: bl, y: height))
        path.addArc(center: CGPoint(x: bl, y: height - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()

        return path
    }
}
