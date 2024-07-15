
import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    
    // 모델 데이터 복제본 만들어서 수정중인 항목이 수정완료될 때까지 원본 반영 안되게 처리
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                // 맨 앞에 취소 버튼 추가. editMode 가 true 일 때만.
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation()
                            .wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }
            else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear(perform: {
                        // 에디터가 표시될 때 로컬 state 에 model 에 저장되어 있는 값 입히기
                        draftProfile = modelData.profile
                    })
                    .onDisappear(perform: {
                        // 에디터가 사라질 때 모델에 draftProfile 데이터값 입히기. 근데 이게 맞나?
                        modelData.profile = draftProfile
                    })
            }
            
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
