//
//  XTUtil_UIKitExtension.swift
//  XTUtil-swift
//
//  Created by teason23 on 2022/8/14.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import RxGesture

// Mark: UIView extension
extension UIView {
        
    /// 任意视图的点击事件 tap on any UIView
    /// 1 多次点击截流
    /// 2 不透传点击事件到其他view
    /// 3 任意的view都能直接获取
    /// - Parameter tapped: event callback block
    public func xt_tapEvent(tapped: @escaping () -> Void) {
        let _ =
        rx.tapGesture { gestureRecognizer, delegate in
            delegate.simultaneousRecognitionPolicy = .never
        }
        .when(.recognized)
        .debounce(RxTimeInterval.milliseconds(600), scheduler: MainScheduler.instance)
        .take(until: self.rx.deallocated)
        .subscribe(onNext: { gesture in
            tapped()
        })
    }
    
        
    // print results of internal apple API method 'recursiveDescription' to console
    public func xt_dump() {
        Swift.print(perform(Selector(("recursiveDescription")))!)
    }
    
    
    
    /// 给所有subview上进行相同的操作
    /// - Parameters:
    ///   - targetView: 目标view
    ///   - level: 当前层级
    ///   - excute: subview回调, 当前视图view, 当前层级lvl
    public func xt_operateWorkOnSubviews(targetView: inout UIView,
                                      level: Int = 0,
                                      excute: @escaping (_ view: inout UIView, _ lvl: Int) -> Void) {
        excute(&targetView, level)
        
        for var subview in targetView.subviews {
            if subview.subviews.count > 0 {
                xt_operateWorkOnSubviews(targetView: &subview, level: level + 1, excute: excute)
            }
        }
    }
}



// Mark: current window
extension UIApplication {
    var currentWindow: UIWindow? {
        connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    }
    
    var keyWindow: UIWindow? {
        UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}



// Mark: current VC
extension XTUtil {
    // 最顶部VC
    class func topMostVC(base: UIViewController? = UIApplication.shared.currentWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topMostVC(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topMostVC(base: top)
            } else if let selected = tab.selectedViewController {
                return topMostVC(base: selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return topMostVC(base: presented)
        }
        
        return base
    }
    
    
    
}
