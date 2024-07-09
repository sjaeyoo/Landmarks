import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()    // 크기 조절 가능하게 세팅
                .frame(width:50, height:50)
            Text(landmark.name)
            Spacer()            // 우측 공간 여유분 지정해서 왼쪽 정렬
        }
    }
}

#Preview("Turtle Rock") {
    LandmarkRow(landmark: landmarks[0])
}

#Preview("Salmon") {
    LandmarkRow(landmark: landmarks[1])
}
