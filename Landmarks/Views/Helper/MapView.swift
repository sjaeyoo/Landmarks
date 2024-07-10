import SwiftUI
import MapKit       // MapKit 프레임워크 사용은 따로 프로젝트 설정 건드리지 않아도 됨


struct MapView: View {
    
    // 좌표. 이 뷰에서 사용하는 coordinate 구조체로 핸들링하는게 적합
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position:
                // 원래 바인딩으로 넘겨주는 값인데 어차피 시작점에서 고정값으로 받는거나 다름없으니 constant 처리
                .constant(
                    .region(region)
                ))
    }
    
    
    /* computed property 로 MapKit 의 Region 생성. getter 역할. region 접근시마다 생성 */
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
