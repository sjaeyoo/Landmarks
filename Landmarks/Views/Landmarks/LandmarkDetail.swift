
import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
        ScrollView {
            // Environment 로 받은 값을 FavoriteButton 에 binding 해서 사용하기 위한 Binding wrapping. 
            @Bindable var modelData = modelData
            
            // 높이 300 고정 Map View 상단 배치
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height:300)
            
            // 이미지 추가
            CircleImage(image: landmark.image)
                .offset(y: -130) // 이미지 offset 조정으로 위로 올리기
                .padding(.bottom, -130) // 이미지 padding 으로 아래 생긴 빈공간 잘라내기
            
            // VStack 의 alignment .leading 은 왼쪽 정렬.
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
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
    let modelData = ModelData()
    
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
