

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        
        GeometryReader { geometry in
            // 2D Outline shape.
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height: CGFloat = width
                
                // x 축 스케일만큼 너비 조정하고 중앙배치. adjustment 쓸거면 얘도 넣는게 맞아보이는데...
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale))/2.0
                
                width *= xScale
                
                path.move (to: CGPoint(
                    x: width * 0.95 + xOffset,
                    y: height * (0.20 + HexagonParameters.adjustment)
                ))
                
                HexagonParameters.segments.forEach { segment in
                    // 정해놓은 대로 이전 segment 의 종점에서 line 먼저 추가하고 커브로 둥글게 처리
                    path.addLine(
                        to: .init(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        // 높이 대비로 너비가 어느정도 차지하는지 비율 정의. 1이면 1:1, 2면 높이가 너비의 2배
        .aspectRatio(1, contentMode: .fit)
    }
    
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#Preview {
    BadgeBackground()
}
