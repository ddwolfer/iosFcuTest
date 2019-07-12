//
//  PhotoController.swift
//  Test003
//
//  Created by ddwolf on 2019/5/27.
//  Copyright © 2019 ddwolf. All rights reserved.
//

import AVFoundation
import UIKit

class PhotoController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIActionSheetDelegate{
    
    var tempImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageAlbum = UIImagePickerController() //生成相簿的Controller
        imageAlbum.sourceType = .savedPhotosAlbum
        imageAlbum.delegate = self   //self 跟view連結？嗎？
        present(imageAlbum, animated: true, completion: nil) //在view上顯示
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var blockView: UIImageView!
    @IBOutlet weak var imageShow: UIImageView!
    
    
    @IBAction func reSelectPhoto(_ sender: Any) {
        let imageAlbum = UIImagePickerController() //生成相簿的Controller
        imageAlbum.sourceType = .savedPhotosAlbum
        imageAlbum.delegate = self   //self 跟view連結？嗎？
        present(imageAlbum, animated: true, completion: nil) //在view上顯示
    }
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //如果有照片
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageShow.contentMode = .scaleToFill //不知道幹嘛的 好像可以刪掉
            imageShow.image = pickedImage //畫面上的空白View = 剛剛接受到的圖片
            //imageShow.image = pickedImage.crop(ratio: 1) //畫面上的空白View = 剛剛接受到的圖片 //裁切照片
            tempImage = imageShow.image
        }
        blockView.isHidden = true  //把黑色背景去掉
        dismiss(animated: true, completion: nil) //關掉選取畫面
    }
    
    //把圖片傳給下一個View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var editPhotoController = segue.destination as! EditPhotoController
        editPhotoController.getPhoto = imageShow.image
    }
    
}


extension UIImage {
    
    //按比例娶圖片（以圖片中心點）
    func crop(ratio: CGFloat) -> UIImage {
        //取得圖片大小計算尺寸
        var newSize:CGSize!
        if size.width/size.height > ratio {
            newSize = CGSize(width: size.height * ratio, height: size.height)
        }else{
            newSize = CGSize(width: size.width, height: size.width / ratio)
        }
        
        //改變比例
        var rect = CGRect.zero
        rect.size.width  = size.width
        rect.size.height = size.height
        rect.origin.x    = (newSize.width - size.width ) / 2.0
        rect.origin.y    = (newSize.height - size.height ) / 2.0
        
        //更改並取得最終圖片
        UIGraphicsBeginImageContext(newSize)
        draw(in: rect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
}
