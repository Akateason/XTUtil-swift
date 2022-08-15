//
//  UIResponderExtension.swift
//  XTUtil-swift
//
//  Created by teason23 on 2022/8/14.
//

import Foundation
import UIKit


public extension UIResponder {
    
    /// 回调事件
    /// - Parameters:
    ///   - name: 事件名
    ///   - info: 信息 [String : Any]
    func xt_sendEventOnResponderChain(name: String, info: [String : Any]) {
        self.next?.xt_sendEventOnResponderChain(name: name, info: info)
    }
    
    /// 找响应者链路上的任意UIResponder类型
    /// - Returns: 要找的Responder
    func xt_findNext<U: UIResponder>(of type: U.Type = U.self) -> U? {
        return self.next.flatMap({$0 as? U ?? $0.xt_findNext() })
    }
    
    /// 响应者链路上最近的VC
    /// - Returns: vc
    func xt_latestVC() -> UIViewController? {
        return xt_findNext(of: UIViewController.self)
    }
    
    /// 打印链路
    /// - Returns: string
    func xt_dumpOnResponderChain() -> String {
        guard let next = next else { return NSStringFromClass(type(of: self)) }
        return NSStringFromClass(type(of: self)) + "->" + next.xt_dumpOnResponderChain()
    }

}
