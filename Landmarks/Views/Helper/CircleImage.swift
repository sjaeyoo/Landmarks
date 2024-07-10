
import SwiftUI


struct CircleImage: View {
    var image: Image
    
    /*
     단일 View 로 구성. 부모 뷰의 레이아웃 배치에 따라 크기가 결정.
     */
    var body: some View {
        image
            .clipShape(Circle())    // padding 없이 원본 이미지의 높낮이 기준으로 마스킹
            .overlay {              // Image 위에 외곽선 두께 4짜리 원을 덮음
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)      // 그림자.
    }
    
    /* clipShape, overlay, shadow 같은 메서드는 View 에 정의된 메서드. 
     Image 가 아닌 다른 View 에서도 사용 가능. */
}

#Preview {
    CircleImage(image: ModelData().landmarks[0].image)
}
