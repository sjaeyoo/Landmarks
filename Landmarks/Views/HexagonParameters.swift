import CoreGraphics // 그림 그리기 용 framework.



struct HexagonParameters {
    
    /* Segment 설계. 
     이전 Segment 의 끝점에서 line 점까지 직선으로 이음.
     line 점에서 베지어 곡선으로 curve 까지 이음.
     control 은 베지어 곡선의 모양을 제어
     */
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control : CGPoint
    }
    
    // 육각형의 위 아래 꼭지점을 제외하고 나머지를 벌리거나 좁히는 튜닝값
    // 이렇게 튜닝할거면 높이도 같이 넘기는게 맞는거 같은데...
    static let adjustment: CGFloat = 0.085
    
    /* Segment 리스트 값. 6각형이므로 6개의 선.
     좌표 체계는 왼쪽 위를 0,0으로, 오른쪽 아래를 1,1로 잡는 unit square. */
    static let segments : [Segment] = [
        
        // 맨 위 꼭지점
        Segment(
            line:       CGPoint(x: 0.60, y: 0.05),
            curve:      CGPoint(x: 0.40, y: 0.05),
            control:    CGPoint(x: 0.50, y: 0.00)
        ),
        // 왼쪽 위 꼭지점
        Segment(
            line:       CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:      CGPoint(x: 0.00, y: 0.30 + adjustment),
            control:    CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        // 왼쪽 아래 꼭지점
        Segment(
            line:       CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:      CGPoint(x: 0.05, y: 0.80 - adjustment),
            control:    CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        // 맨 아래 꼭지점
        Segment(
            line:       CGPoint(x: 0.40, y: 0.95),
            curve:      CGPoint(x: 0.60, y: 0.95),
            control:    CGPoint(x: 0.50, y: 1.00)
        ),
        // 오른쪽 아래 꼭지점
        Segment(
            line:       CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:      CGPoint(x: 1.00, y: 0.70 - adjustment),
            control:    CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        // 오른쪽 위 꼭지점
        Segment(
            line:       CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:      CGPoint(x: 0.95, y: 0.20 + adjustment),
            control:    CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
