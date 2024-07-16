import UIKit
import SwiftUI


/// 수평 점으로 표현되는 PageView 의 indicator 컨트롤.  UIKit 컴포넌트지만 SwiftUI 의 View 내에서 병합
struct PageControl: UIViewRepresentable {
    
    typealias UIViewType = UIPageControl
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        // control에 valueChaged 이벤트가 발생했을 때 updateCurrentPage 호출하도록 묶어주기
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl){
            self.control = control
        }
        
        
        @objc
        func updateCurrentPage(sender: UIPageControl){
            control.currentPage = sender.currentPage
        }
    }
    
}
