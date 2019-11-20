//
//  SecOBVC.swift
//  onboarding
//
//  Created by imac on 20/11/19.
//  Copyright © 2019 JeguLabs. All rights reserved.
//

import UIKit
import Hero

class SecOBVC: UIViewController {
    
    let simpleTxt: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello world2!"
        lbl.textColor = .white
        lbl.font = demiBoldFont(size: 24)
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.simpleTxt.heroID = "1"
        view.addSubview(simpleTxt)
        simpleTxt.center(inView: view)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlerTap))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func handlerTap() {
        self.navigationController?.popViewController(animated: true)
    }

}
