//
//  ViewController.swift
//  CPFocusRing
//
//  Created by Pai Peng on 04/07/2024.
//  Copyright (c) 2024 Pai Peng. All rights reserved.
//

import UIKit
import CPFocusRing

class ViewController: UIViewController {
    
    @IBOutlet weak var focusRing: CPFocusRing!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        focusRing.setDelegate(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController: CPFocusRingDelegate {
    func focus(focusDistance: CGFloat) {
        print("focus: \(focusDistance)")
    }
    
}
