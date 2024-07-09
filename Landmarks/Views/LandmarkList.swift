

import SwiftUI

struct LandmarkList: View {
    
    var landmarks: [Landmark]
    
    var body: some View {
        List(landmarks) { landmark in
            HStack {
                LandmarkRow(landmark: landmark)
            }
        }
    }
}

#Preview {
    LandmarkList(landmarks: landmarks)
}



/*
struct LandmarkList: View {
    
    var landmarks: [Landmark]
    
    var body: some View {
        // \.id 에서 보이는 \.xxx 는 key path 표현 식. landmark 객체의 id 라는 항목에 접근. 이름에 접근하고 싶었으면 \.name. 다만 Landmark 에 identifiable 을 구현하면 id 파라미터 생략 가능해진다.
        List(landmarks, id: \.id) { landmark in
            HStack {
                LandmarkRow(landmark: landmark)
            }
        }
    }
}
 */
