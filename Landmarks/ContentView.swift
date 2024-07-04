import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}

#Preview {
    ContentView()
}


/**
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
