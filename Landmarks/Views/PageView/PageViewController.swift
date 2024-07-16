import SwiftUI
import UIKit

// UIKit 사용해보는 튜토리얼.

struct PageViewController<Page: View> : UIViewControllerRepresentable {
    
    // 튜토리얼 버전과 달리 UIViewControllerRepresentable 프로토콜에 typealias 가 생긴듯
    typealias UIViewControllerType = UIPageViewController
    
    var pages: [Page]
    
    // binding 으로 현재 페이지 인덱스를 연결해서 가져오게 함
    @Binding var currentPage: Int
    

    /// SwiftUI 는 makeUIViewController 호출 전에 makeCoordinator() 를 호출해 Coordinator 를 생성.
    /// 생성된 coordinator 는 context 에 물려져서 context.coordinator 로 접근 가능해짐
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        // coordinator 를 데이터 소스로 물려주기
        pageViewController.dataSource = context.coordinator
        // coordinator 를 delegate 로 물려주기
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        // context 에 물려놓은 coordinator 로 controller 접근 가능. 첫페이지로 이동하는 코드
        uiViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    
    
    /// SwiftUI 와 UIKit 사이의 상호작용을 조정하고, 데이터와 이벤트를 전달하는 데 사용
    class Coordinator: NSObject,
                       UIPageViewControllerDataSource, // PageViweController 의 동작에서 다음/이전 viewcontroller 를 정의하기 위한 프로토콜
                       UIPageViewControllerDelegate     // PageViewController 의 동작에서 현재 뷰의 변화 후처리를 위한 프로토콜
    {
        
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        
        /// 현재 뷰 이전 뷰를 가져오기. 순환형으로 만들기 위해 첫 페이지면 마지막 페이지 가져옴
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return controllers.last
            }
            
            return controllers[index - 1]
        }
        
        /// 현재 뷰 다음 뷰를 가져오기.순환형으로 만들기 위해 마지막 페이지면 첫 페이지 가져옴
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index + 1 == controllers.count {
                return controllers.first
            }
            
            return controllers[index + 1]
        }
        
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
