

import SwiftUI

struct LayoutPracticeView: View {
    
    @State var name: String = ""
    @State var isEnabled: Bool = true
    
    
    /// ViewBuilder 가 여러 뷰를 감지하면 자동으로 수직배치. 최외곽에 VStack 으로 감싸져 있는 것과 동일함.
    var body: some View {
        ScrollView {
            /** VStack. 기본적인 세로 배치. **/
            Text("VStack").font(.title)
            VStack(spacing: 0) {
                Text("1st").background(.red)
                Text("2nd").background(.green)
            }.background(.teal)
            Divider()
            
            /** HStack. 기본적인 가로 배치. 줄바꿈이 발생하지 않고 자식 뷰의 Width 가 줄어듦. **/
            Text("HStack").font(.title)
            HStack(spacing: 0) {
                Text("1st").background(.red)
                Text("2nd").background(.green)
            }.background(.teal)
            Divider()
            
            /** ZStack. 겹쳐서 배치. 하위 뷰 중 가장 큰 뷰의 사이즈와 동일. **/
            Text("ZStack").font(.title)
            ZStack(alignment: .center) {
                Text("1st").foregroundStyle(.red)
                Text("2ndssss")
            }.background(.teal)
            Divider()
            
            /** Spacer. **/
            Text("Spacer in HStack").font(.title)
            HStack(spacing: 0) {
                Text("1st").background(.red)
                //자동으로 부모 뷰 기준으로 여분의 공간을 차지
                Spacer()
                Text("2nd").background(.green)
            }.background(.teal)
            Divider()
            
            /** GeometryReader. 부모  뷰 크기를 내부에서 수치로 사용하게 만듦. **/
            Text("GeometryReader in HStack").font(.title)
            HStack {
                /* 
                 부모뷰의 크기에 따라 GeomtryReader를 사용한 뷰의 크기가 결정.
                 1. 부모뷰의 크기의 최대치가 정해져있을 때 -> 잔여공간을 채우는 방향
                 2. 부모뷰의 크기가 무제한일 때 -> 자식뷰로 결정
                 */
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Text("Left 2/3").frame(width: geometry.size.width * 2/3).background(.red)
                        Text("Right 1/3").frame(width: geometry.size.width/3).background(.green)
                    }
                }.background(.teal).frame(maxHeight: 100)
            }
            Divider()
            
            /** Group. 레이아웃의 변화 없이 그냥 부모 레이아웃을 따라가지만 묶어서 처리하기 위한 뷰 **/
            Text("Group in HStack").font(.title)
            HStack(spacing: 0) {
                Group {
                    Text("1st").background(.red)
                    Text("2nd").background(.green)
                    
                }
            }.background(.teal)
            Divider()
            
            
            /** ScrollView.  LazyVStack 은 필요시 View 를 생성하는 VStack. LazyHStack 도 있음. **/
            /*
             부모뷰의 크기에 따라 ScrollView 의 크기가 결정.
             1. 부모뷰의 크기의 최대치가 정해져있을 때 -> 잔여공간을 채우는 방향
             2. 부모뷰의 크기가 무제한일 때 -> 자식뷰로 결정
             */
            Text("ScrollView with LazyVStack").font(.title)
            ScrollView {
                LazyVStack {
                    ForEach(0..<1000) { i in
                        Text("Item \(i)")
                    }
                }
            }.background(.teal).frame(maxHeight: 100)
            Divider()
            
            if #available(iOS 16.0, *) {
                /** Grid. 격자 배치. **/
                /*
                 부모뷰의 크기에 따라 Grid 의 세로 길이 결정.
                 단, 가로 길이는 자식 뷰의 최대 크기에 영향받음
                 1. 부모뷰의 세로 길이 최대치가 정해져있을 때 -> 잔여공간을 채우는 방향
                 2. 부모뷰의 세로 길이가 무제한일 때 -> 자식뷰로 결정
                 */
                Text("Grid. > iOS 16.0").font(.title)
                Grid {
                    GridRow {
                        Text("0, 0").background(.red)
                        Text("0, 1").background(.green)
                    }
                    GridRow {
                        Text("1, 0").background(.green)
                        Text("1, 1").background(.red)
                    }
                }.background(.teal)
                Divider()
            }
            
            /** List. 컴포넌트 화 된 목록 뷰. **/
            /*
             부모뷰의 크기에 따라 List 의 크기가 결정.
             1. 부모뷰의 크기의 최대치가 정해져있을 때 -> 잔여공간을 채우는 방향
             2. 부모뷰의 크기가 무제한일 때 -> 높이가 0이 됨
             */
            Text("List").font(.title)
            List {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
                Text("Item 4")
            }.background(.teal).frame(minHeight: 100)
            Divider()
            
            
            
            /** Form. 컴포넌트 화 된 목록 뷰. **/
            /*
             부모뷰의 크기에 따라 Form 의 크기가 결정.
             1. 부모뷰의 크기의 최대치가 정해져있을 때 -> 잔여공간을 채우는 방향
             2. 부모뷰의 크기가 무제한일 때 ->  높이가 0이 됨
             */
            Text("Form").font(.title)
            Form {
                TextField("Enter your name", text: $name)
                Toggle("Enable Notifications", isOn: $isEnabled)
            }.background(.teal).frame(minHeight: 200)
            Divider()
        }
        
    }
}

#Preview {
    LayoutPracticeView()
}




/*
 layout 에서 부모뷰와 자식뷰의 크기는 항상 일관되지는 않음.
 특히 ScrollView 같이 무제한의 크기를 갖는 뷰 안에 다른 뷰를 배치할 때 문제가 발생하기 쉬움.
 
 세로 길이 기준으로 무제한일 경우 다음과 같은 특징을 가짐
 
 1. 자식뷰를 감쌀 크기로 결정
 - Grid, GeometryReader 사용한 뷰
 2. 높이가 0
 - Spacer, ScrollView, List, Form

 */
