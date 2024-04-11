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
        
        
        let focusRing = CPFocusRing(frame:CGRectMake(0,200, self.view.frame.size.width, 80), focusDistance: 0.5)
        focusRing.layer.borderColor = UIColor.green.cgColor
        focusRing.layer.borderWidth = 2
        
        self.view.addSubview(focusRing)
        
        focusRing.setDelegate(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}


extension ViewController: CPFocusRingDelegate {
    func focus(focusDistance: CGFloat) {
        print("focus: \(focusDistance)")
    }
    
}
