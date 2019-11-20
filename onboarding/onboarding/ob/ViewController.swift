//
//  ViewController.swift
//  onboarding
//
//  Created by imac on 20/11/19.
//  Copyright © 2019 JeguLabs. All rights reserved.
//

import UIKit
import Hero

public func demiBoldFont(size: CGFloat) -> UIFont {
    return UIFont(name: "AvenirNext-DemiBold", size: size)!
}

class ViewController: UIViewController {
    
    let simpleTxt: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello world!"
        lbl.textColor = .white
        lbl.font = demiBoldFont(size: 24)
        return lbl
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.simpleTxt.alpha = 1
        self.simpleTxt.center(inView: view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        self.hero.isEnabled = true
        self.simpleTxt.heroID = "1"
        
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .black
        
        view.addSubview(simpleTxt)
        simpleTxt.center(inView: view)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handlerTap))
        view.addGestureRecognizer(gesture)
        
        view.layoutIfNeeded()
    }
    
    
    @objc func handlerTap() {
        self.anim()
    }
    
    func nextPage() {
        let sec = SecOBVC()
        sec.isHeroEnabled = true
        self.navigationController?.pushViewController(sec, animated: true)
    }

    
    func anim() {
        UIView.animate(withDuration: 0.25, animations: {
            self.simpleTxt.frame = CGRect(x: self.view.frame.minX, y: self.simpleTxt.frame.minY, width: self.simpleTxt.frame.width, height: self.simpleTxt.frame.height)
            self.simpleTxt.alpha = 0
        }) { (_) in
            self.simpleTxt.frame = CGRect(x: self.view.frame.maxX, y: self.simpleTxt.frame.minY, width: self.simpleTxt.frame.width, height: self.simpleTxt.frame.height)
            self.simpleTxt.alpha = 0
            self.nextPage()
        }
    }
    
}

