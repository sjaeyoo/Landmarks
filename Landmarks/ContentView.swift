import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack (alignment: .center) {
            // 높이 300 고정 Map View 상단 배치
            MapView()
                .frame(height:300)
            
            // 이미지 추가
            CircleImage()
                .offset(y: -130) // 이미지 offset 조정으로 위로 올리기
                .padding(.bottom, -130) // 이미지 padding 으로 아래 생긴 빈공간 잘라내기
            
            // VStack 의 alignment .leading 은 왼쪽 정렬.
            VStack(alignment: .leading) {
                
                Text("Tutle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                // HStack 으로 감싸진 View 내에 일괄 적용. 내부 View 에 특정한 설정이 없는 한 이 값이 inherit 되서 적용
                .font(.subheadline)
                .foregroundStyle(.secondary)    // HierarchicalShapeStyle 로 색상 흐리게 함. primary, secondary, tertiary, quaternary 까지 있음.
                
                // Divider 로 구분선
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }.padding()
            
            
            // Spacer 로 하단 여백 처리. 이를 통해 ContentView 는 부모 뷰의 잔여공간을 모두 채우는 모양이 됨.
            Spacer()
        }
            
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

