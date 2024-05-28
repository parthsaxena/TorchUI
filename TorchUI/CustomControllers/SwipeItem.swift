import SwiftUI

struct SwipeItem<Content: View, SwipeActions: View>: View {
    
    var content: () -> Content
    var swipeActions: () -> SwipeActions
    var screenHeight: CGFloat
    
    @State var hoffset: CGFloat = 147
    @State var anchor: CGFloat = 0
    @State private var swipeActionsOpacity = 0.0
    
    let screenWidth = UIScreen.main.bounds.width
    var anchorWidth: CGFloat { 147 }
    var swipeThreshold: CGFloat { screenWidth / 15 }
    
    @State var leftPast = false
    
    init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder swipeActions: @escaping () -> SwipeActions, screenHeight: CGFloat) {
        self.content = content
        self.swipeActions = swipeActions
        self.screenHeight = screenHeight
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                content()
                    .frame(width: geo.size.width)
                    .zIndex(1)
                swipeActions()
                    .zIndex(0)
                    .opacity(swipeActionsOpacity)
            }
        }
        .offset(x: -anchorWidth + hoffset)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .frame(height: screenHeight)
        .gesture(drag)
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                withAnimation {
                    hoffset = anchor + value.translation.width

                    if abs(hoffset) > anchorWidth {
                        if leftPast {
                            hoffset = anchorWidth
                        }
                    }
                    
                    if anchor > 0 {
                        leftPast = hoffset > anchorWidth - swipeThreshold
                    } else {
                        leftPast = hoffset > swipeThreshold
                    }
                }
            }
            .onEnded { value in
                withAnimation {
                    if leftPast {
                        anchor = anchorWidth
                        swipeActionsOpacity = 0.0
                    } else {
                        anchor = 0
                        swipeActionsOpacity = 1.0
                    }
                    hoffset = anchor
                }
            }
    }
}
