//
//  ViewController.swift
//  XTUtil-swift
//
//  Created by teason23 on 2021/7/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.xt_tapEvent {
            print("32423424 \(NSDate.now)")
        }
        
        XTUtil.measure {
            foo()
        }
        
        
    }

    
    func foo() {
        for i in 1...9999 {
            xtPrint(i)
        }
    }

}

