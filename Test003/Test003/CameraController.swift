//
//  CameraController.swift
//  Test003
//
//  Created by ddwolf on 2019/5/27.
//  Copyright © 2019 ddwolf. All rights reserved.
//

import Foundation
import UIKit

class CameraController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var blockView: UIImageView!
    var tempImage : UIImage!
    @IBOutlet weak var showImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let imagePicker = UIImagePickerController() //生成相機的Controller
        imagePicker.sourceType = .camera //設定來源為相機（這個contro用相機）
        imagePicker.delegate = self //self 跟view連結？嗎？
        //imagePicker.allowsEditing = true //允許客製化設定
        
        present(imagePicker, animated: true, completion: nil) //在view上顯示        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func reTakePicture(_ sender: Any) {
        let imagePicker = UIImagePickerController() //生成相機的Controller
        imagePicker.sourceType = .camera //設定來源為相機（這個contro用相機）
        imagePicker.delegate = self //self 跟view連結？嗎？
        imagePicker.allowsEditing = true //允許客製化設定
        
        present(imagePicker, animated: true, completion: nil) //在view上顯示        // Do any additional setup after loading the view.
    }
    
    
    
    //當self接收到照片的時候顯示
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //如果有照片
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            showImage.contentMode = .scaleToFill //不知道幹嘛的 好像可以刪掉
            showImage.image = pickedImage //畫面上的空白View = 剛剛接受到的圖片
            tempImage = pickedImage
            blockView.isHidden = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var editPhotoController = segue.destination as! EditPhotoController
        editPhotoController.getPhoto = tempImage
        
    }
    
    @IBAction func sureToSave(_ sender: Any) {
        //UIImageWriteToSavedPhotosAlbum(tempImage, nil, nil, nil)
        //let alertController = UIAlertController(title: "提示", message: "照片已儲存", preferredStyle: .alert)
        //let exitBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        //alertController.addAction(exitBtn)
        
        //present(alertController, animated: true,completion: nil)
        
        
    }
}

