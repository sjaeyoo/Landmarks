import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList(landmarks: landmarks)
    }
}

#Preview {
    ContentView()
}


/*
 import SwiftUI

 struct ContentView: View {
     var body: some View {
         
         // VStack 에 넘어가는 Closure 파라미터는 다른 일반적인 Closure 와 다름. 선언적 활용을 위해 그냥 여러 줄에 파라미터를 넘기면 ViewBuilder 에 정의된 buildBlock 중 적절한 게 먼저 동작하여 하나의 View 로 만든다. 이 동작은 컴파일러 레벨에서 동작하므로 일반적인 1급 객체 처리를 위한 Closure 와 다르고 그냥 코드 블럭으로 이해하는 게 빠름.
         // @resultBuilder, @autoclosure 같은 것들도 마찬가지로 다르게 처리 됨.
         VStack {
             Image(systemName: "globe")
                 .imageScale(.large)
                 .foregroundStyle(.tint)
             Text("Hello, world!")
         }
         .padding()
     }
 }
 
 */

/*
    // 이러한 builder 패턴에서 뷰는 항상 새로 생성 됨. 구조체 사용. 선언형 UI 및 State 기반 시스템에서 값 타입의 불변성이 오류 발생가능성을 낮추기 때문.
     Image(systemName: "globe")
         .imageScale(.large)
         .foregroundStyle(.tint)
 
 
    
 
 */

