import SwiftUI
import MapKit       // MapKit 프레임워크 사용은 따로 프로젝트 설정 건드리지 않아도 됨


struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
    
    /* computed property 로 MapKit 의 Region 생성. getter 역할. region 접근시마다 생성 */
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView()
}
