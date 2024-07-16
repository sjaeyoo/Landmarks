import SwiftUI
import UIKit

// UIKit 사용해보는 튜토리얼

struct PageViewController<Page: View> : UIViewControllerRepresentable {
    // 튜토리얼 버전과 달리 UIViewControllerRepresentable 프로토콜에 typealias 가 생긴듯
    typealias UIViewControllerType = UIPageViewController
    
    var pages: [Page]
    
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
}
