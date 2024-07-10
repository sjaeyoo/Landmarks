
import SwiftUI

struct LandmarkDetail: View {
    
    
    var landmark: Landmark
    
    var body: some View {
        
        ScrollView {
            // 높이 300 고정 Map View 상단 배치
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height:300)
            
            // 이미지 추가
            CircleImage(image: landmark.image)
                .offset(y: -130) // 이미지 offset 조정으로 위로 올리기
                .padding(.bottom, -130) // 이미지 padding 으로 아래 생긴 빈공간 잘라내기
            
            // VStack 의 alignment .leading 은 왼쪽 정렬.
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                // HStack 으로 감싸진 View 내에 일괄 적용. 내부 View 에 특정한 설정이 없는 한 이 값이 inherit 되서 적용
                .font(.subheadline)
                .foregroundStyle(.secondary)    // HierarchicalShapeStyle 로 색상 흐리게 함. primary, secondary, tertiary, quaternary 까지 있음.
                
                // Divider 로 구분선
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }.padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}
