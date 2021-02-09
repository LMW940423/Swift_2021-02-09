//
//  ViewController.swift
//  ImageView
//
//  Created by 이민우 on 2021/02/04.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    var imgOn : UIImage? // 켜진 전구 이미지
    var imgOff : UIImage? // 꺼진 전구 이미지
    var isZoom = false // 이미지 확대 여부 (처음엔 축소된 상태이기 때문에 false로 시작)

    override func viewDidLoad() {
        super.viewDidLoad()
        // 이미지 파일 연결
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // imgView에 image 할당하기
        imgView.image = imgOff
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        // 이미지 크기를 두배로
        let scale : CGFloat = 2.0
        var newWidth : CGFloat
        var newHeigth : CGFloat
        
        if isZoom{
            newWidth = imgView.frame.width / scale
            newHeigth = imgView.frame.height / scale
            btnResize.setTitle("Image확대", for: .normal) // normal은 현재상태! .은 enum(약어)!
        }else{
            newWidth = imgView.frame.width * scale
            newHeigth = imgView.frame.height * scale
            btnResize.setTitle("Image축소", for: .normal) // normal은 현재상태! .은 enum(약어)!
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeigth)
        isZoom = !isZoom // 반대로 바꾸는 것!
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        switch sender.isOn{
        case true:
            imgView.image = imgOn
        default :
            imgView.image = imgOff
        }
        
//        if sender.isOn{
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
    }
}

