
import SwiftUI

struct FeatureCard: View {
    
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}


struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors:[.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            // lineargradient 도 뷰 취급이라 ZStack 에 겹칠 수 있음.
            gradient
            VStack(alignment: .leading, content: {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            })
            .padding()
        })
        .foregroundStyle(.white)
    }
}


#Preview {
    FeatureCard(landmark: ModelData().landmarks[0])
        .aspectRatio(3.0/2.0, contentMode: .fit)
}
