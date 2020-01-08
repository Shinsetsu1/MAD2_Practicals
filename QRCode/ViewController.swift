//
//  ViewController.swift
//  QRCode
//
//  Created by MAD2_P02 on 29/11/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startBtn(_ sender: Any) {
        if true {
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Content") as
                UIViewController
            vc.modalPresentationStyle = .fullScreen // try without fullscreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}

