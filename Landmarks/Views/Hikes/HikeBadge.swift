import SwiftUI

struct HikeBadge: View {
    var name: String
    
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
            // 원본 뱃지가 300x300 사이즈로 기획되었으므로 300으로 잡고 1/3 스케일처리
                .frame(width: 300, height: 300)
                .scaleEffect(1.0/3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
