import SwiftUI
import CoreLocation
/*
 LandmarkData.json 의 serialize/deserialize 용 bean.
 
 
 {
     "name": "Silver Salmon Creek",
     "category": "Lakes",
     "city": "Port Alsworth",
     "state": "Alaska",
     "id": 1002,
     "isFeatured": false,
     "isFavorite": false,
     "park": "Lake Clark National Park and Preserve",
     "coordinates": {
         "longitude": -152.665167,
         "latitude": 59.980167
     },
     "description": "Suscipit inceptos est felis purus aenean aliquet adipiscing diam venenatis, augue nibh duis neque aliquam tellus condimentum sagittis vivamus, cras ante etiam sit conubia elit tempus accumsan libero, mattis per erat habitasse cubilia ligula penatibus curae. Sagittis lorem augue arcu blandit libero molestie non ullamcorper, finibus imperdiet iaculis ad quam per luctus neque, ligula curae mauris parturient diam auctor eleifend laoreet ridiculus, hendrerit adipiscing sociosqu pretium nec velit aliquam. Inceptos egestas maecenas imperdiet eget id donec nisl curae congue, massa tortor vivamus ridiculus integer porta ultrices venenatis aliquet, curabitur et posuere blandit magnis dictum auctor lacinia, eleifend dolor in ornare vulputate ipsum morbi felis. Faucibus cursus malesuada orci ultrices diam nisl taciti torquent, tempor eros suspendisse euismod condimentum dis velit mi tristique, a quis etiam dignissim dictum porttitor lobortis ad fermentum, sapien consectetur dui dolor purus elit pharetra. Interdum mattis sapien ac orci vestibulum vulputate laoreet proin hac, maecenas mollis ridiculus morbi praesent cubilia vitae ligula vel, sem semper volutpat curae mauris justo nisl luctus, non eros primis ultrices nascetur erat varius integer.",
     "imageName": "silversalmoncreek"
 }
 
 */
struct Landmark: Hashable, Codable {
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    
    private var imageName: String       // json 내에 있는 imageName string property. serialize/deserialize 때 빼고는 쓸 일 없으니까 private 로 선언
    
    private var coordinates: Coordinates
    
    
    // Coordinate 구조체 정의. 외부에서도 많이 쓰일만 하지만 직/역직렬화 때만 사용해도 상관 없으므로 inner struct 로 정의하는 게 구조적으로 문제되는 부분은 없음.
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}



/**
 UI Framework 쪽에서 쓰일 항목들
 */
extension Landmark {
    
    var image: Image {                  // computed property 로 image view 를 불러옴.
        Image(imageName)
    }
    
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
