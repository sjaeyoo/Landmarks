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
            
            //ViewBuilder도 if statement 사용 가능. for 문은 못씀. for 는 ForEach 같은 별도 구문으로 처리
            if landmark.isFavorite {
                // Image 중 시스템에서 제공하는 이미지도 사용 가능
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            
        }
    }
}

#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

