//
//  CurrentVC+View+Window.swift
//  XTUtil-swift
//
//  Created by teason23 on 2022/8/16.
//

import Foundation
import UIKit



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



// Mark: top VC
extension UIApplication {
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
