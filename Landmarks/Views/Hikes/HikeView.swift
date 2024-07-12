/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    showDetail.toggle()
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                    // 회전 애니메이션.
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                    // rotation 애니메이션 비활성화.
                        .animation(nil, value: showDetail)
                    // 크기 애니메이션.
                        .scaleEffect(showDetail ? 1.5 : 1 )
                        .padding()
                    // 애니메이션 타입 easeInOut 으로 설정.
                        .animation(.easeInOut, value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
