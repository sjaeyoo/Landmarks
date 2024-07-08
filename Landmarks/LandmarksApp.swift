import SwiftUI





//@main
//struct LandmarksApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

 // 위 코드 구조에서 생략된 부분을 명시적으로 작성한다면?
@main   // App 의 entry point 정의
struct LandmarksApp: App {
    // body 는 App 프로토콜에서 정의한 associated type.
    // some 키워드는 이 body 변수가 Scene 프로토콜을 준수하는 어떤 타입임을 의미.
    var body: some Scene {
        // body 는 computed property 임
        get {
            // WindowGroup 정의 및 클로저 명시적으로 작성. Content 를 Buider 패턴으로 WindowGroup 에 생성자로 넘겨주기 위함
            let windowGroupContent: () -> ContentView = {
                return ContentView()
            }
            
            // Layout 연습용 View
            let layoutPractice: () -> LayoutPracticeView = {
                return LayoutPracticeView()
            }
            
            // WindowGroup 생성자 호출
            let windowGroup = WindowGroup(content: windowGroupContent)
            
            // body 프로퍼티에서 WindowGroup 반환
            return windowGroup
            
        }
    }
}

