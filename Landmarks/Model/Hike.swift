

import Foundation


/**
 hikeData 의 직렬화/역직렬화 위한 구조체
 */
struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    
    
    struct Observation: Codable, Hashable {
        
        var distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}


// Hike 구조체를 UI 에서 활용할 때 쓸 확장 메서드
extension Hike {
    
    static var formatter = LengthFormatter()
    
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
}
