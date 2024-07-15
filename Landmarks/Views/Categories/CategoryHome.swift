import SwiftUI

struct CategoryHome: View {
    
    @Environment(ModelData.self) var modelData
    
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(.init()) // inset 없앰
                
                
                ForEach (modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(.init()) // inset 없앰
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
