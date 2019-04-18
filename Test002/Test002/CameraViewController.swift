//
//  CameraViewController.swift
//  Test002
//
//  Created by ddwolf on 2019/4/15.
//  Copyright © 2019 ddwolf. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cameraFlag = 0 //判斷是開相機還是拍照
    
    @IBOutlet weak var showImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //與開啟相機的Button連結
    @IBAction func cameraButton(_ sender: Any) {
        let imagePicker = UIImagePickerController() //生成相機的Controller
        imagePicker.sourceType = .camera //設定來源為相機（這個contro用相機）
        imagePicker.delegate = self //self 跟view連結？嗎？
        present(imagePicker, animated: true, completion: nil) //在view上顯示
        cameraFlag = 0
    }
    
    //與開啟相簿的Button連結
    @IBAction func showAlbum(_ sender: Any) {
        let imageAlbum = UIImagePickerController() //生成相簿的Controller
        imageAlbum.sourceType = .savedPhotosAlbum
        imageAlbum.delegate = self   //self 跟view連結？嗎？
        present(imageAlbum, animated: true, completion: nil) //在view上顯示
        cameraFlag = 1
    }
    //當self接收到照片的時候顯示
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //如果有照片
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            showImage.contentMode = .scaleToFill //不知道幹嘛的 好像可以刪掉
            showImage.image = pickedImage //畫面上的空白View = 剛剛接受到的圖片
            if cameraFlag == 0{ //如果是拍照得來的圖片就儲存(因為開相簿也會觸發到,如果多重觸發就會變成一堆照片)
                UIImageWriteToSavedPhotosAlbum(pickedImage, nil, nil, nil) //儲存
            }
        }
        dismiss(animated: true, completion: nil)
    }
}
