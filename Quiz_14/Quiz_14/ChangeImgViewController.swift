//
//  ViewController.swift
//  Quiz_06
//
//  Created by 이민우 on 2021/02/04.
//

import UIKit

class ChangeImgViewController: UIViewController {

    @IBOutlet weak var lblImageName: UILabel!
    @IBOutlet weak var ImgView: UIImageView!
    
    var images = [UIImage?]()
    var imageNames = [String?]()
    
    // 선생님 방식
//    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
//    var numImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //선생님 방식
//        displayImage(number : numImage)
        
        // 이미지 이름 저장
        for i in 1...6{
            imageNames.append("flower_0\(i).png")
        }
        
        // 이미지 파일 연결
        for i in 1...6{
            images.append(UIImage(named: "flower_0\(i).png"))
        }
        
        // 이미지 할당
        ImgView.image = images[0]
    }

    @IBAction func btnPrevious(_ sender: UIButton) {
        changeImaAndTxt(from : "previous")
        
        // 선생님 방식
//        numImage -= 1
//        if numImage < 0{
//            numImage = imageName.count - 1
//        }
//        displayImage(number: numImage)
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        changeImaAndTxt(from : "next")
        
        // 선생님 방식
//        numImage += 1
//        if numImage >= imageName.count{
//            numImage = 0
//        }
//        displayImage(number: numImage)
    }
    
    // text와 image를 바꿔주는 함수
    func changeImaAndTxt(from : String) {
        
        // lblImageName의 text속 숫자를 뽑아내기
        let sp1Array = lblImageName.text?.split(separator: "_")
        let sp2Array = sp1Array![1].split(separator: ".")
        let intNum = Int(sp2Array[0])
        
        // from에 따라 다르게 작동!
        switch from{
        case "previous":
            if intNum == 1{
                lblImageName.text = imageNames[imageNames.count - intNum!]
                ImgView.image = images[images.count - intNum!]
            }else{
                lblImageName.text = imageNames[intNum! - 2]
                ImgView.image = images[intNum! - 2]
            }
        default :
            if intNum == 6{
                lblImageName.text = imageNames[0]
                ImgView.image = images[0]
            }else{
                lblImageName.text = imageNames[intNum!]
                ImgView.image = images[intNum!]
            }
        }
        
    }
    // 선생님 방식
//    func displayImage(number : Int){
//        ImgView.image = UIImage(named: imageName[number])
//        lblImageName.text = imageName[number]
//    }
}

