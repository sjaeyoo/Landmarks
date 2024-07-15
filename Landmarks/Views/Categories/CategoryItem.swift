import SwiftUI

struct CategoryItem: View {
    
    var landmark: Landmark
    
    var body: some View {
        
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .clipShape(.rect(cornerRadii: .init(cornerRadius: 5)))
            Text(landmark.name)
        }
        .padding(.leading, 15)
        
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
