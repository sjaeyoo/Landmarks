import Foundation




struct Profile {
    var username: String
    var preferNotifications: Bool = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    // default 라는 예약어를 상수명으로 사용하고 싶어서 백틱(`)을 사용
    static let `default` = Profile(username: "g_kumar")
    
    
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
