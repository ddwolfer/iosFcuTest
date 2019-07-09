//
//  EditPhotoController.swift
//  Test003
//
//  Created by ddwolf on 2019/6/3.
//  Copyright © 2019 ddwolf. All rights reserved.
//

import Foundation
import UIKit

class EditPhotoController: UIViewController {
    
    @IBOutlet weak var showPhoto: UIImageView!
    
    var getPhoto : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPhoto.image = getPhoto
    }
    
}
