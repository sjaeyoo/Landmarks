

import SwiftUI

struct Badge: View {
    
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees(Double(index) / Double(8)) * 360.0)
               
        }
        .opacity(0.5)
    }
    
    
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0/4.0, anchor: .top) // 크기조정. 엄청 구조적으로 맞춰서 한건 아닌듯
                    .position(x: geometry.size.width/2.0, y: (3.0/4.0) * geometry.size.height)  // 위치조정. 마찬가지로 엄청 구조적인지는 잘 모르겠음
            }
        }
        .scaledToFit() //width : height 비율 유지한 상태로 부모 뷰에 맞춰지게
    }
}

#Preview {
    Badge()
}
