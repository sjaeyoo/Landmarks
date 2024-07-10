

import SwiftUI

struct LandmarkList: View {
    // State property 의 변화 시 영향받는 모든 뷰는 다시 render 됨. 선언형 UI 의 특징
    // State property 는 외부에서 값을 변경해도 뷰 내부에서 변경을 감지하지 못함. private 으로 선언하는 편이 안전함
    // 외부의 영향을 받게 하고 싶으면 Binding 으로 처리
    @State private var showFavoritesOnly = false
    
    // 환경변수로 데이터를 처리함. 왜일까? 어차피 상위에서 데이터를 로드해야되는건 같고 데이터를 넘겨주는 형태로 활용하는데. 그냥 예제라서 그런듯.
    @Environment(ModelData.self) var modelData
    
    
    // computed property 로 landmark 필터링. showFavoritesOnly 가 State기 때문에 변화의 영향을 filteredLandmarks 도 받음.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        // SwiftUI 에서 navigation 할 때는 Navigation 으로 감싸는 형식을 사용한다.
        // iOS 16 기준으로 메인이 되는 방식은 NavigationStack 과 NavigationSplitView.
        // NavigationSplitView 는 iPad 나 MacOS 에서 큰 화면 표시에 적합하다.
        // NavigationSplitView 를 iOS 에서 실행하면 기본적으로 sidebar 부분이 표시된다.
        NavigationSplitView {
            List {
                // List 안에 여러 view 들이 복합적으로 배치 가능.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    // 이동할 View(destination)은 NavigationLink 를 사용.
                    // 이 NavigationLink 로 감싸지면 ListView item 에 ">" 기호로 link item 임이 표기됨
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)  // List 의 item 선택 시 이동할 view
                    } label: {
                        LandmarkRow(landmark: landmark) //List의 목록에 표기되는 view 리스트
                    }
                }
            }
            .animation(.default, value: filteredLandmarks) // 기본 애니메이션 설정. filteredLandmarks 에 변화가 발생할 때 동작
            .navigationTitle("Landmarks")   // navigation title. Navigation View 안의 여러 뷰가 타이틀을 사용하는 경우 첫번째 항목이 표시됨.
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}



/*
struct LandmarkList: View {
    
    var landmarks: [Landmark]
    
    var body: some View {
        // \.id 에서 보이는 \.xxx 는 key path 표현 식. landmark 객체의 id 라는 항목에 접근. 이름에 접근하고 싶었으면 \.name. 다만 Landmark 에 identifiable 을 구현하면 id 파라미터 생략 가능해진다.
        List(landmarks, id: \.id) { landmark in
            HStack {
                LandmarkRow(landmark: landmark)
            }
        }
    }
}
 */
