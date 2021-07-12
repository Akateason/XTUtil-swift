//
//  XTUtil.swift
//  XTUtil-swift
//
//  Created by teason23 on 2021/7/13.
//

import UIKit

public class XTUtil: NSObject {
    public static func measure(f: ()->()) {
        let start = CACurrentMediaTime()
        f()
        let end = CACurrentMediaTime()
        print("🌪测量时间为: \(end - start)")
    }
}

public func xtPrint<T>(_ message: T, fileName: String = #file, funcName: String = #function, lineNum : Int = #line) {
    #if DEBUG
        print("「 \((fileName as NSString).lastPathComponent) 第\(lineNum)行 \(funcName) 」\("\n")\(message)")
    #endif
}
