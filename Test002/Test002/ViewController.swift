//
//  ViewController.swift
//  Test002
//
//  Created by ddwolf on 2019/4/15.
//  Copyright © 2019 ddwolf. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ButtonTest: UIButton!
    @IBOutlet weak var TypeTest: UITextField!
    @IBOutlet weak var TextTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickButton(_ sender:UIButton) {
        TextTest.text = TypeTest.text
        TypeTest.text = ""
    }
    
    @IBAction func closeKeyboard(_ sender: Any) {
    }
}

